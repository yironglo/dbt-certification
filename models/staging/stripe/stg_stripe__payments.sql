with
    payments as (

        select
            id as payment_id,
            orderid as order_id,
            paymentmethod as payment_method,
            status as payment_status,
            amount / 100 as payment_amount_usd,
            created as created_at,
            _batched_at as loaded_at

        from {{ source("stripe", "payment") }}
    )

select *
from payments
