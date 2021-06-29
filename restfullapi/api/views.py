from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import HttpResponse

# from snippets.models import Snippet
# from snippets.serializers import SnippetSerializer

import json

@api_view(['POST'])
def index(request):
    # if request.method == 'GET':
    #     return Response([{
    #         'Halo semuaa'
    #     }])
    if request.method == 'POST':
        data = json.loads(request.body)
        
        satu = data['satu']
        dua = data['dua']
        operator = data['operator']
        
        if operator == '+':
            result = int(satu) + int(dua)
            responData = {
                'result': result
            }
        elif operator == '-':
            result = int(satu) - int(dua)
            responData = {
                'result': result
            }
        elif operator == ':' or operator == '/':
            result = int(satu) / int(dua)
            responData = {
                'result': result
            }
        elif operator == 'x' or operator == 'X':
            result = int(satu) * int(dua)
            responData = {
                'result': result
            }
        return HttpResponse(json.dumps(responData), content_type='application/json')

@api_view(['GET'])
def get_number(request):
    responseData = {
        'number': 100,
    }
    if request.method == 'GET':
        return HttpResponse(json.dumps(responseData), content_type="application/json")