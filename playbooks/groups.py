#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2016-11-04 15:29:17
# @Author  : eter
# @Link    : --
# @Version : v1.0.0
##################################
#
#
##################################
num    = 16
target = 32
step   = 5
iplist = []
groups = []

##################################
def getIpListFromFile(ipfile):
    """
    get the ip list from file.
    """
    with open(ipfile,'r') as f :
        for line in f.readlines():
            iplist.append(line.strip())

    return(iplist)

##################################
def getIpGroups(target,step,iplist):
    """
    get the ip group from iplist
    """
    for time in range(0, target):
        cur_g=[]
        groups.append(cur_g)
        for index in range(0, step):
            cur_num = (time + index) % num
            cur_g.append(iplist[cur_num])

    return(groups)

##################################
def createInventoryFile(inventory, iplist, primary, secondary):
    """
    create inventory file for playbook
    """
    inventory_info="""#
# This is %s for playbook
[mongod]
%s

[primary]
%s

[secondary]
%s
""" % (inventory, '\n'.join(iplist), primary, '\n'.join(secondary))

    return(inventory_info)

##################################
if __name__ == '__main__':

    try:

        fiplist=getIpListFromFile('./inventory/uc_hosts.txt')

        groups=getIpGroups(target=32,step=5,iplist=fiplist)

        for port in range(7301, 7333):
            for group in groups:
                inventory_file="./inventory/inventory_%s" % port
                inventory_info=createInventoryFile(inventory_file,
                                              group,
                                              group[0],
                                              group[1:])

                with open(inventory_file, "w") as f:
                    f.write(inventory_info)

                print(inventory_info)
                break

    except Exception as e:
        print e
