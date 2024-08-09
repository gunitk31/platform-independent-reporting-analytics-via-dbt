{% snapshot scd_raw_listings %}

{{
    config(
        target_schema='airbnb_snapshots',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at_ts',
        invalidate_hard_deletes=True
    )
}}

select 
    {{ cast_str_to_timestamp('updated_at') }} AS updated_at_ts,
    * 
FROM 
    {{ source('airbnb', 'listings') }}

{% endsnapshot %}