repadmin /showutdvec c-sv-vedc.tec.dom dc=domaindnszones,dc=tec,dc=dom | sort /+60
rem repadmin /showutdvec c-sv-phdc.tec.dom dc=domaindnszones,dc=tec,dc=dom | sort /+60

echo VEDC synchronizing . . .
echo.
repadmin /syncall w-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall m-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall t-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d

echo VEDC end of synch . . .
echo.

repadmin /syncall w-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall c-sv-phdc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall m-sv-phdc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall n-sv-phdc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d
repadmin /syncall t-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d

repadmin /syncall w-sv-vedc.tec.dom dc=domaindnszones,dc=tec,dc=dom /e /d
repadmin /syncall c-sv-phdc.tec.dom dc=domaindnszones,dc=tec,dc=dom /e /d
repadmin /syncall m-sv-phdc.tec.dom dc=domaindnszones,dc=tec,dc=dom /e /d
repadmin /syncall n-sv-phdc.tec.dom dc=domaindnszones,dc=tec,dc=dom /e /d
repadmin /syncall t-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom /e /d

repadmin /showutdvec c-sv-vedc.tec.dom dc=domaindnszones,dc=tec,dc=dom | sort /+60

repadmin /showutdvec c-sv-vedc.tec.dom dc=forestdnszones,dc=tec,dc=dom | sort /+60
pause