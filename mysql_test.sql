SELECT 
product_name, product_img_url,
product_url, product_price_min, 
product_short_description
FROM grommet_products
JOIN grommet_product_categories ON grommet_products.id = grommet_product_categories.product_id
JOIN grommet_gifts_categories ON grommet_product_categories.product_category_id = grommet_gifts_categories.id
WHERE grommet_gifts_categories.sub_category = 'Jewelry' AND grommet_products.is_sold_out = False;


SELECT 
product_name, product_img_url,
product_url, product_price_min, 
product_short_description
FROM grommet_products
JOIN grommet_product_to_keyword ON grommet_products.id = grommet_product_to_keyword.product_id
JOIN grommet_product_keywords ON grommet_product_to_keyword.keyword_id = grommet_product_keywords.id
WHERE grommet_product_keywords.keyword = 'Hair accessor' AND grommet_products.is_sold_out = False;


SELECT 
producer_name, product_img_url,
product_url, product_price_min, 
product_short_description
FROM grommet_products
JOIN grommet_product_to_keyword ON grommet_products.id = grommet_product_to_keyword.product_id
JOIN grommet_product_keywords ON grommet_product_to_keyword.keyword_id = grommet_product_keywords.id
JOIN grommet_product_categories ON grommet_products.id = grommet_product_categories.product_id
JOIN grommet_gifts_categories ON grommet_product_categories.product_category_id = grommet_gifts_categories.id
WHERE 
(grommet_gifts_categories.sub_category = 'Beauty & Personal Care' OR grommet_gifts_categories.sub_category = 'Skincare') 
OR grommet_product_keywords.keyword = 'Aromatherapy' 
AND grommet_products.is_sold_out = False;
