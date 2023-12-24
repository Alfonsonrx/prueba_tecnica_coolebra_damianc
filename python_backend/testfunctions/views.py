from django.http import JsonResponse
from django.db import connection
from .utils import gen_array_by_ean

# Create your views here.
def get_processed_data_view(request):
  query = "SELECT prod.name, prod.SKU, prod.ean, prod.market_id, CASE WHEN pri.active = 0 THEN pri.normal_price WHEN pri.active = 1 THEN pri.discount_price END AS menor_precio FROM `product` AS prod JOIN `price` AS pri WHERE prod.SKU = pri.product_SKU;"
  with connection.cursor() as cursor:
    cursor.execute(query)
    results = cursor.fetchall()
    
  data = gen_array_by_ean(results)
  return JsonResponse(data[0])