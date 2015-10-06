HTTP Redirector [1]
===================

A private HTTP redirector.  Adjust your DNS configuration (`/etc/hosts`) to
point tracking redirectors to your private HTTP redirector instead of the
tracking redirector.

Currently supported tracking redirectors:

* dr.peytzmail.com

Other domain names you may want to point to your private HTTP redirector:

* cdn.userreport.com
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


Installing
----------

```
   make install
```

You can adjust the installation location with `PREFIX` and `DESTDIR`.


Testing
-------

```
   make test
```


Building
--------

```
   make build
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

