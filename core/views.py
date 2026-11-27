from django.shortcuts import render

def swimmer_list(request):
    return render(request, template_name='core/swimmer_list.html')
