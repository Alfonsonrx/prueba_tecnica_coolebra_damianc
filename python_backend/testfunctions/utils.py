def gen_array_by_ean(results):
  data = {}
  for row in results:
    precio_producto = int(row[4])
    if row[2] not in data:
      data[row[2]] = {"prod_name": row[0], "query_data": [], "market_quantity": 0, "price_range": {"precio_mayor": precio_producto, "precio_menor": precio_producto}}
    
    data[row[2]]["query_data"].append(row)
    data[row[2]]["market_quantity"] += 1
    
    data[row[2]]["price_range"]["precio_mayor"] = max(data[row[2]]["price_range"]["precio_mayor"], precio_producto)
    data[row[2]]["price_range"]["precio_menor"] = min(data[row[2]]["price_range"]["precio_menor"], precio_producto)
  
  res_array = [data]
  
  return res_array