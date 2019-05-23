# HB_HC_MPI
Templates and scripts for provisioning HB60rs and HC44rs virtual machines

The template in the existingVNet branch will deploy to an existing Vnet with no Public IP addresses.

The machines can be built from either a markletplace Windows 2016 image, or a customized image.

The post deployment script will enable Infiniband driver install between all the nodes.


[![Click to deploy template on Azure](http://azuredeploy.net/deploybutton.png "Click to deploy template on Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgrandparoach%2FHB_HC_MPI%2FexistingVNet%2Fazuredeploy.json)  

