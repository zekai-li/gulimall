periodYear,
  periodNumber,
  unitname ,
  subjname ,
  creditquantity,
  creditamount,
  accu_creditquantity,
  accu_creditamount,
  trader

case when
subjname ='煤'or
    subjname='氟化铝'or
    subjname='石油'or
    subjname='氧化铝'or
    subjname='液态天然气'or
    subjname='铜'or
    subjname='铝锭'or
    subjname='锌'or
    subjname='燃气'or
    subjname='化工产品' then subjname
else '其他'
end
 creditquantity
  creditamount
  debitamount
  accu_creditquantity
  accu_creditamount
  accu_debitamount
  end_quantity
  end_balance_amount
  accu_profit
profit

 sum(creditquantity) as  creditquantity,
  sum(creditamount) as  creditamount,
  sum(debitamount) as  debitamount,
  sum(accu_creditquantity) as  accu_creditquantity,
  sum(accu_creditamount) as  accu_creditamount,
  sum(accu_debitamount) as  accu_debitamount,
  sum(end_quantity) as  end_quantity,
  sum(end_balance_amount) as  end_balance_amount,
  sum(accu_profit) as   accu_profit ,
  sum(profit) as profit


select
    unitname,
    periodYear,
    periodNumber,
    subjname,
    sum(creditquantity) as creditquantity,
    sum(creditamount) as creditamount,
    sum(debitamount) as debitamount,
    sum(accu_creditquantity) as accu_creditquantity,
    sum(accu_creditamount) as accu_creditamount,
    sum(accu_debitamount) as accu_debitamount,
    sum(end_quantity) as end_quantity,
    sum(end_balance_amount) as end_balance_amount,
    sum(accu_profit) as accu_profit,
    sum(profit) as profit
from
    (
        select
            unitname,
            periodYear,
            periodNumber,
            case
                when subjname = '煤'
                    or subjname = '氟化铝'
                    or subjname = '石油'
                    or subjname = '氧化铝'
                    or subjname = '液态天然气'
                    or subjname = '铜'
                    or subjname = '铝锭'
                    or subjname = '锌'
                    or subjname = '燃气' then subjname
                else '其他'
                end as subjname,
            creditquantity,
            creditamount,
            debitamount,
            accu_creditquantity,
            accu_creditamount,
            accu_debitamount,
            end_quantity,
            end_balance_amount,
            accu_profit,
            profit
        from
            ads_trade_varieties
        where
                concat(periodYear, periodNumber) not in ('202108')
    ) as a
group by
    unitname,
    periodYear,
    periodNumber,
    subjname



select `trade_varieties_tmp`.`periodYear` AS `periodYear`,`trade_varieties_tmp`.`periodNumber` AS `periodNumber`,`trade_varieties_tmp`.`unitname` AS `unitname`,`trade_varieties_tmp`.`subjname` AS `subjname`,`trade_varieties_tmp`.`creditquantity` AS `creditquantity`,`trade_varieties_tmp`.`creditamount` AS `creditamount`,`trade_varieties_tmp`.`accu_creditquantity` AS `accu_creditquantity`,`trade_varieties_tmp`.`accu_creditamount` AS `accu_creditamount`,`trade_varieties_tmp`.`trader` AS `trader` from `trade_purchase_tmp` where (`trade_varieties_tmp`.`periodNumber` = '07') order by `trade_varieties_tmp`.`creditamount` desc limit 20