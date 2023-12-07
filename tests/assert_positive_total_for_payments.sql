select
    order_id,
    sum(payment_amount_usd) as total_amount
from {{ ref('stg_stripe__payments') }}
group by 1
having not(total_amount >= 0)