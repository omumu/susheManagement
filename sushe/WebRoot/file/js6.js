
   var initialtab = [1, "sc1"];

    var previoustab = "";
    var intv;

    function expandcontent(cid, aobject)
        {
        stopTimer();

        highlighttab(aobject)

        if (previoustab != "")
            document.getElementById(previoustab).style.display = "none"

        document.getElementById(cid).style.display = "block"
        previoustab = cid
        }

    function highlighttab(aobject)
        {
        stopTimer();

        if (typeof tabobjlinks == "undefined")
            collectddimagetabs()

        for (i = 0; i < tabobjlinks.length; i++)
            tabobjlinks[i].className = ""

        aobject.className = "current"
        }

    function collectddimagetabs()
        {
        var tabobj = document.getElementById("ddimagetabs")
        tabobjlinks = tabobj.getElementsByTagName("A")
        }

    function do_onload()
        {
        collectddimagetabs()
        expandcontent(initialtab[1], tabobjlinks[initialtab[0] - 1])
        }

    function startTimer()
        {
        intv = setTimeout("expandcontent(initialtab[1], tabobjlinks[initialtab[0]-1])", 2000);
        }

    function stopTimer()
        {
        clearTimeout(intv);
        }

   
    