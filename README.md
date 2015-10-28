HTTP Redirector [1]
===================

A private HTTP redirector.  Adjust your DNS configuration (`/etc/hosts`) to
point tracking redirectors to your private HTTP redirector instead of the
tracking redirector.

Currently supported tracking redirectors:

* dm.peytzmail.com
* dr.peytzmail.com
* universitetsavisen.nyhedsbrev.f2.peytz.dk
* tr.anpdm.com

Other domain names you may want to point to your private HTTP redirector:

* ad.linksynergy.com
* b.scorecardresearch.com
* bt.tns-gallup.dk
* cdn.userreport.com
* c.statcounter.com
* dr.tns-gallup.dk
* easeniro.information.dk
* edge.quantserve.com
* gadk.hit.gemius.pl
* ho.idtargeting.com
* information.tns-gallup.dk
* ing.tns-gallup.dk
* int.sitestat.com
* kt.tns-gallup.dk
* meter-svc.nytimes.com
* pagead2.googlesyndication.com
* partner.googleadservices.com
* pol.tns-gallup.dk
* raeson.tns-gallup.dk
* sb.scorecardresearch.com
* securepubads.g.doubleclick.net
* s.effectivemeasure.net
* smetrics.washingtonpost.com
* stats.bbc.co.uk
* tag.userreport.com
* tracead.com
* track.idtargeting.com
* tv2.tns-gallup.dk
* us-ads.openx.net
* us-u.openx.net
* version2.tns-gallup.dk
* www.googleadservices.com
* www.google-analytics.com


Build dependencies
------------------

+ Zsh
* GNU Parallel
* GNAT (including the `gnatmetric` tool)
* Mercurial (hg)
* Perl
* Wget
* Tar
* AWS (the Ada Web Server library)


Installing
----------

```
   OS_VERSION=unix make install
```

Builds and tests the executable before installing it in
"${DESTDIR}${PREFIX}/bin" (where "${PREFIX}" defaults to "${HOME}").

Installing may also work on Windows, if you substitute "OS_VERSION=unix" with
"OS_VERSION=windows".


Testing
-------

```
   OS_VERSION=unix make test
```


Building
--------

```
   OS_VERSION=unix make build
```


Links
-----

If you want to find free Ada tools or libraries AdaIC [2] is an excellent
starting point.  You can also take a look at my other source text
repositories [3] or my web site [4].

[1] Source text repository:
    http://repositories.jacob-sparre.dk/http-redirector

[2] Free Ada Tools and Libraries:
    http://www.adaic.org/ada-resources/tools-libraries/

[3] My repositories on Bitbucket:
    http://repositories.jacob-sparre.dk/

[4] My web site:
    http://www.jacob-sparre.dk/

