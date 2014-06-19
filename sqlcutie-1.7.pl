#!/usr/bin/perl --
=for comment

MP""""""`MM MM'"""""`MMM M""MMMMMMMM                     dP   oo         
M  mmmmm..M M  .mmm,  MM M  MMMMMMMM                     88              
M.      `YM M  MMMMM  MM M  MMMMMMMM .d8888b. dP    dP d8888P dP .d8888b.
MMMMMMM.  M M  MM  M  MM M  MMMMMMMM 88'  `"" 88    88   88   88 88ooood8
M. .MMM'  M M  `MM    MM M  MMMMMMMM 88.  ... 88.  .88   88   88 88.  ...
Mb.     .dM MM.    .. `M M         M `88888P' `88888P'   dP   dP `88888P'
MMMMMMMMMMM MMMMMMMMMMMM MMMMMMMMMMM 

      *-----------------------------------------------------------*	 
      |                                                           |
      |      SQLCutie 1.7                                         |
      |                                                           |
      |      SQLCutie is a database error-detection scanner       |
      |      It's consisted of 10 different DB, with over 20      |
      |      of common errors. Using quick dorking algorithm      |
      |      to grab the best results.                            |
      |                                                           |
      |      SQLCutie is NOT FOR those who seek to damage or      |
      |      destroy or steal people property and privacy         |
      |      SQLCutie is made for the goodwill hackers and        |
      |      web admins to detect bugs & vulnerabilities AND      |
      |      report them.                                         |
      |                                                           |
      |      The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR      |
      |      ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!         |
      |                                                           |
      |      Rants: I have fire under my ass after some skid      |
      |      used this program to hack some company.              |
      |      Cops came knocking on my door so it's about          |
      |      time I write this term.                              |
      |                                                           |
      *-----------------------------------------------------------*

      This program is free software: you can redistribute it and/or modify
      it under the terms of the GNU General Public License as published by
      the Free Software Foundation, either version 3 of the License, or
      (at your option) any later version.

      This program is distributed in the hope that it will be useful,
      but WITHOUT ANY WARRANTY; without even the implied warranty of
      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
      GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
      along with this program.  If not, see <http://www.gnu.org/licenses/>

=cut
use LWP::UserAgent;
use HTTP::Request;
use Term::ANSIColor qw(:constants);

#-----------------------------------------------------------#
#      Help menu                                            #
#-----------------------------------------------------------#

sub help
{
     system('clear');
     print title;
     print YELLOW;
     print q(
 SQLCutie is NOT FOR those who seek to damage or
 destroy or steal people property and privacy
 SQLCutie is made for the goodwill hackers and
 web admins to detect bugs & vulnerabilities AND
 report them.);
     print BOLD;
     print q(

 The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR
 ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!);
     print "\n";
     print RESET;

     print BLUE, "\n[!] Usage   : $0 <option>\n";
     print GREEN, "-----------------------------------";
     print BOLD, GREEN, "\n--|| Options\n\n", RESET;
     print GREEN, "     -d           Dorking function (dh)\n";
     print GREEN, "     -p           Define a proxy to use (ph)\n";
     print "     -o           Save result in a file\n";
     print "     -h           Print this help manual\n";
     print "     -r           Change log, description & term\n";
     print "     -dh          Print dork manual\n";
     print "     -ph          Print proxy manual\n";
     print "     -u           Update to latest version\n";
     print "-----------------------------------\n\n", RESET;
     exit();
}

sub title
{
    print BOLD,"\n\n This program comes with ABSOLUTELY NO WARRANTY\n";
    print " This is free software and you are welcome to\n";
    print " redistribute it under certain conditions of GPL 3.0\n\n",RESET;
}

sub readme
{
	system('clear');
	
	print title;
     print YELLOW;
     print q(
 SQLCutie is NOT FOR those who seek to damage or
 destroy or steal people property and privacy
 SQLCutie is made for the goodwill hackers and
 web admins to detect bugs & vulnerabilities AND
 report them.);
     print BOLD;
     print q(

 The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR
 ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!);
     print "\n";
     print RESET;
	print GREEN, "\n\n    -----------------------------------\n";
	print BOLD,GREEN,"    SQLCutie ",YELLOW,"1.7\n",RESET;
	print GREEN,"    This program is distributed under GNU GPL 3.0\n",RESET;
	print BLUE,"    http://pastebin.com/NdVZ5HVX\n",RESET;
	print GREEN, "    -----------------------------------\n\n";
	print GREEN,"  Changes on 1.7:\n\n",RESET;
	print BLUE,BOLD,"     - Updated to bing dork\n",RESET;

	print GREEN, "\n  If anyone looking toward to improve this, feel free to do so!\n",RESET;
	print BLUE,"\n $0 -h\n\n",RESET;
	exit();
}

sub dorkhelp
{
	system('clear');
	print title;
     print YELLOW;
     print q(
 SQLCutie is NOT FOR those who seek to damage or
 destroy or steal people property and privacy
 SQLCutie is made for the goodwill hackers and
 web admins to detect bugs & vulnerabilities AND
 report them.);
     print BOLD;
     print q(

 The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR
 ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!);
     print "\n";
     print RESET;
	print     BOLD,"\n\n[!] Info [!]\n\n",RESET;
	print     YELLOW " inurl:",GREEN,"    <- indicates Query in URL\n",RESET;
	print     YELLOW," intitle:",GREEN,"  <- indicates Query in Title\n",RESET;
	print     YELLOW," intext:",GREEN,"   <- indicates Query in File Content\n",RESET;
	print     YELLOW," related:",GREEN,"  <- Related Query Content\n",RESET;
	print     YELLOW," site:",GREEN,"     <- indicates URL Domain\n",RESET;
	print     YELLOW," filetype:",GREEN," <- indicate File Type\n",RESET;
	print     YELLOW," ext:",GREEN,"      <- Similar to filetype\n",RESET;
	print     YELLOW," all",GREEN,"       <- Sub-query 'all' works only like 'allinurl','allintitle','allrelated' and 'allintext'\n",RESET;
	print     YELLOW," *",GREEN,"         <- Wildcard\n",RESET;
	print     YELLOW," \"\"",GREEN,"        <- Matches Entire Query\n",RESET;
	print     YELLOW," ()",GREEN,"        <- Brackets for Boolean operators (See Below)\n",RESET;
	print     YELLOW," |",GREEN,"         <- OR (Use only in brackets with queries like 'inurl', 'intitle','filetype' or 'related'\n",RESET;
	print     YELLOW," &",GREEN,"         <- AND (Use only in brackets with a query)\n",RESET;
	print     YELLOW," +",GREEN,"         <- spacing (I'll fix this in next version so u can add actual space)\n\n",RESET;
	print     BOLD,"[!] Basic [!]\n\n",RESET;
	print     YELLOW," php?id\n",GREEN," -- Dorks for any PHP ext with param of 'id'\n",CYAN," Since we didn't indicate the exact query, it will get contents from anywhere (Doesn't need to be in URL)\n\n";
	print     YELLOW," inurl:php?id\n",GREEN," -- Dorks for PHP ext with param of 'id' only from URL\n",CYAN," See the difference?\n\n";	
	print     YELLOW," intitle:php?id\n",GREEN," -- Dorks for text 'php?id' in the title\n\n";
	print     YELLOW," site:gov+inurl:php?id\n",GREEN," -- Dorks top-lvl domain 'gov' with PHP ext and 'id' param only from URL\n\n";
	print     YELLOW," site:google.ca\n",GREEN," -- Dorks domain 'google.ca' only from URL\n\n";
	print     YELLOW," site:.google.ca\n",GREEN," -- Dorks ANY sub-domain(s) of 'google.ca' only from URL\n",CYAN," See the difference between a dot?\n\n";
	print     YELLOW," site:play.google.ca\n",GREEN," -- Dorks specifically sub-domain 'play.google.ca' only from URL\n\n";
	print     YELLOW," (asp|aspx)?id=\n",GREEN," -- Dorks URL ext 'asp' OR 'aspx' with 'id' param\n",CYAN," ONLY works inside",RED,BOLD," '' ",RESET,CYAN,"or",RED,BOLD," \"\"",RESET,CYAN,"\n Ex: $0 -d ",BOLD,"'(index|forum|cart).php?id='\n\n",RESET;
	print     YELLOW," cute+AND+nice+inurl:php?cat=\n",GREEN," -- Dorks for both words 'cute' & 'nice' and PHP ext with 'cat' param only from URL\n\n";
	print     YELLOW," (cart|forum)*?id=\n",GREEN," -- Dorks for sub-queries 'cart' or 'forum' in ANY available query (could be ext & vice versa) with 'id' param\n",CYAN," The * indicate any available result\n\n";
	print     YELLOW," php?(id|cat)=\n",GREEN," -- Dorks for PHP ext with param of 'id' or 'cat'\n\n";
	print     YELLOW," (asp|php)?(id|cat)=\n",GREEN," -- Dorks for PHP or ASP exts with param of 'id' or 'cat'\n\n",RESET;
	print     BOLD,"[!] Advanced [!]\n\n",RESET;
	print     YELLOW," inurl:\"wp-download.php?dl_id=\"\n",GREEN," -- SQLi Vuln CVE 2008-1646\n\n",RESET;
	print     YELLOW," allinurl:(asp|aspx|php)?(id=|q=)&*+site:mil\n",GREEN," -- Search for 'asp','aspx' OR 'php' with param 'id' OR 'q' AND any other param with top-lvl domain 'mil'\n\n",RESET;
	print     YELLOW," \"you have an error in your sql syntax\"+php?id=\n",GREEN," -- Precisely dorks for MySQLi vuln with PHP ext and 'id' param\n\n",RESET;
	print CYAN,"[=] For some reasons queries like inurl or intitle don't work inside single/double quotes, so avoid using them (this will be fixed in next 2-3 version)\n";
	print 		  "[=] ALWAYS use single/double quotes for queries which have () | & and/or \"\"\n";
	print 		  "[=] For long query string, avoid using inurl/intext/intitle/related (see 1st reason)\n";
	print 		  "[=] Play around with queries. Do not give up if it doesn't show. Remember! Tries different query if ones don't work!\n";
	print 		  "[=] Check out ",UNDERLINE,"http://www.exploit-db.com/google-dorks/",RESET,CYAN," for more special dorks! Or make your own specials!\n";
	print 		  "[=] If u still have question about query, email me at ",UNDERLINE,"madfedora\@openmail.cc\n",RESET;
	print BLUE,"\n$0 -h\n\n",RESET;
	exit();
}

sub proxyhelp
{
	system('clear');
	print title;
	print GREEN,"\n[?] Example: ./sqlcutie -p ",BOLD,"http://127.0.0.1:9050/\n";
	print "[!] To install TOR: $0 -t\n",RESET;
	print BLUE,"$0 -h\n\n",RESET;
	exit();
}

sub update
{
	system('clear');
	
	print title;
     print YELLOW;
     print q(
 SQLCutie is NOT FOR those who seek to damage or
 destroy or steal people property and privacy
 SQLCutie is made for the goodwill hackers and
 web admins to detect bugs & vulnerabilities AND
 report them.);
     print BOLD;
     print q(

 The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR
 ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!);
     print "\n";
     print RESET;
	print GREEN,"\n[!] Updating...\n";
	system('wget http://pastebin.com/raw.php?i=NdVZ5HVX -r -O ./sqlcutie && ls -l sqlcutie ; chmod u+x ./sqlcutie ; dos2unix ./sqlcutie');
        print BOLD,"";
	system('echo "For what changed run: ./sqlcutie -r"');
        print "\n",RESET;
	exit();
}

sub tor
{
	system('clear');
	
	print title;
	print GREEN,BOLD,"\n[!] You're installing TOR\n[!] Please enter your permission password to proceed if being prompted\n",YELLOW,"[!] Press Ctrl C to exit\n",RESET;
	system('sudo apt-get install tor || sudo yum install tor && service tor start');
	print YELLOW"If TOR didn't start automaticall, please start run 'tor' command in different terminal.",RESET;
	print BLUE,BOLD"\nTo use: $0 -p http://127.0.0.1:9050/ -d <input>\n",RESET;
	exit();
}

sub variables
{
	my $i=0;
	foreach (@ARGV)
	{
        if ($ARGV[$i] eq "-d"){$search_dork = $ARGV[$i+1]}
        if ($ARGV[$i] eq "-o"){$vulnf = $ARGV[$i+1]}
        if ($ARGV[$i] eq "-p"){$proxy = $ARGV[$i+1]}
	if ($ARGV[$i] eq "-h"){&help}
	if ($ARGV[$i] eq "-r"){&readme}
	if ($ARGV[$i] eq "-dh"){&dorkhelp}
	if ($ARGV[$i] eq "-ph"){&proxyhelp}
	if ($ARGV[$i] eq "-u"){&update}
	if ($ARGV[$i] eq "-t"){&tor}
         $i++;
	}
}

sub main
{
	system('clear');
	
	print title;
     print YELLOW;
     print q(
 SQLCutie is NOT FOR those who seek to damage or
 destroy or steal people property and privacy
 SQLCutie is made for the goodwill hackers and
 web admins to detect bugs & vulnerabilities AND
 report them.);
     print BOLD;
     print q(

 The devs of SQLCutie WON'T HOLD RESPONSIBLE FOR
 ANYTHING YOU HAVE DONE ON BREAKING THE LAWS!);
     print "\n";
     print RESET;
	print GREEN, " \n--------------------------------------\n";
	print BOLD," \n    SQLCutie ",YELLOW,"1.7\n",RESET;
	print BLUE," \n    madfedora\@openmail.cc\n",RESET;
	print BLUE," \n    audiomachinery\@mail.ru\n",RESET;
	print GREEN," \n--------------------------------------\n\n",RESET;
	if (@ARGV+1){print GREEN,"[?] For Help : ",BOLD,"$0 -h\n\n",RESET;}
}

sub vulnscanner
{
     checksearch();
     search1($search_dork);
     search2($search_dork);
}
sub checksearch
{
	my $request   = HTTP::Request->new(GET => "http://www.ask.com/web?q=$search_dork&page=1");
	my $useragent = LWP::UserAgent->new(agent => 'Mozilla/5.0 (Windows; U; Windows NT 6.1) AppleWebKit/531.7.2 (KHTML, like Gecko) Version/5.1 Safari/531.7.2');
	$useragent->proxy("http", "http://$proxy/") if defined($proxy);
	my $response  = $useragent->request($request) ;
	my $result    = $response->content;
}         

sub search1
{
     my $dork  = $_[0];
     for ($i=1;$i<200;$i=$i+10)
     {
	#my $request   = HTTP::Request->new(GET => "http://www.ask.com/web?q=$dork&page=$i");
	my $request   = HTTP::Request->new(GET => "http://www.bing.com/search?q=$dork&go=&filt=all&first=$i");
        my $useragent = LWP::UserAgent->new(agent => 'Mozilla/5.0 (Windows; U; Windows NT 6.1) AppleWebKit/531.7.2 (KHTML, like Gecko) Version/5.1 Safari/531.7.2');
        $useragent->proxy("http", "http://$proxy/") if defined($proxy);
        my $response  = $useragent->request($request) ;
        my $result    = $response->content;
	#while ($result =~ m/class=\"url txt_lg\" href=\"(.*?)\" onmousedown=\"pk\(this,\{en:\'te\'/g)
	while ($result =~ m/<h2><a href="(.*?)" h="ID/g)
         {
             print BLUE, "[!] Scanning > $1\n", RESET;     
             checkvuln($1)
         }
     }                  
}
sub search2
{
     my $dork  = $_[0];
     for ($i=1;$i<20;$i++)
     {
	my $request   = HTTP::Request->new(GET => "http://www.bing.com/search?q=$dork&go=&filt=all&first=$i");
	my $useragent = LWP::UserAgent->new(agent => 'Mozilla/5.0 (Windows; U; Windows NT 6.1) AppleWebKit/531.7.2 (KHTML, like Gecko) Version/5.1 Safari/531.7.2');
        $useragent->proxy("http", "http://$proxy/") if defined($proxy);
        my $response  = $useragent->request($request) ;
        my $result    = $response->content;
	while ($result =~ m/<h2><a href="(.*?)" h="ID/g)

	{
        	my $dorkurl ="http://".$3 ;
        	print BLUE, "[!] Scanning > $dorkurl\n",RESET;
        	checkvuln($dorkurl);
        }
     }
}

sub checkvuln
{
     my $urlscan   = $_[0];
     my $link       = $urlscan.('\'');
     my $ua         = LWP::UserAgent->new();
     $ua->proxy("http", "http://$proxy/") if defined($proxy);
     my $req        = $ua->get($link);
     my $fz       = $req->content;
#-----------------------------------------------------------#
#      MySQL                                                #
#-----------------------------------------------------------#
     if ($fz =~ m/mysql_num_rows/i || $fz =~ m/mysql_numrow/i)

     {
	print BOLD, GREEN, "[!] MySQL Num Row -> $urlscan\n", RESET;
	 print BOLD, WHITE "[*] Exploitable\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL Row] $urlscan\n");
         }
     }

     elsif ($fz =~ m/mysql_fetch_/i || $fz =~ m/mysql_fetch_array/i || $fz =~ m/FetchRow()/i|| $fz =~ m/GetArray()/i )
     {
         print BOLD, GREEN, "[!] MySQL Fetch (Array/Row) -> $urlscan\n", RESET;
	 print BOLD, WHITE "[*] Exploitable\n", RESET;
         if (defined($vulnf))
         { 
		push (@vuln1,"[MySQL Fetch] $urlscan\n");
         }
     }

     elsif ($fz =~ m/Unexpected EOF found when reading file/i)
     {
         print BOLD, GREEN, "[!] MySQL 1039 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL 1039] $urlscan\n");
         }
     }

     elsif ($fz =~ m/Triggers cannot be created on system tables/i || $fz =~ m/Triggers can not be created on system tables/i)
     {
         print BOLD, GREEN, "[!] MySQL 1465 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL 1465] $urlscan\n");
         }
     }
     elsif ($fz =~ m/Can't get working directory/i)
     {
         print BOLD, GREEN, "[!] MySQL 1015 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL 1015] $urlscan\n");
         }
     }
     elsif ($fz =~ m/You have an error in your SQL syntax/i || $fz =~ m/Query failed/i || $fz =~ m/SQL query failed/i)
     {
         print BOLD, GREEN, "[!] MySQL Error Code: 1064 -> $urlscan\n", RESET;
	 print BOLD, WHITE "[*] Exploitable\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL 1064] $urlscan\n");
         }
     }
     elsif ($fz =~ m/The used SELECT statements have a different number of columns/i)
     {
         print BOLD, GREEN, "[!] ERROR 1222 -> $urlscan\n", RESET;
	 print BOLD, WHITE "[*] Exploitable\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln1,"[MySQL 1222] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      Microsoft OLE/ODBC/JET [MsSQL/Access]                #
#-----------------------------------------------------------#
     elsif ($fz =~ m/ODBC SQL Server Driver/i || $fz =~ m/ODBC Microsoft Access Driver/i || $fz =~ m/OLE DB Provider for ODBC/i)
     {
         print BOLD, GREEN, "[!] Microsoft ODBC [Access] -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln3,"[ODBC] $urlscan\n");
         }
     }
     elsif ($fz =~ m/Microsoft OLE DB Provider for SQL Server/i || $fz =~ m/Unclosed quotation mark/i)
     {
         print BOLD, GREEN, "[!] Microsoft OLE DB [MsSQL] -> $urlscan\n", RESET;
	 print BOLD, WHITE "[*] Exploitable\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[OLE DB] $urlscan\n");
         }
     }
     elsif ($fz =~ m/VBScript Runtime/i)
     {
         print BOLD, GREEN, "[!] VBScript Runtime -> $urlscan\n", RESET;
	 print BOLD, YELLOW "[x] Unexploitable\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[VBScript] $urlscan\n");
         }
     }
     elsif ($fz =~ m/Microsoft JET Database/i)
     {
         print BOLD, GREEN, "[!] Microsoft JET [Access] -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln3,"[JET DB] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      ADO DB                                               #
#-----------------------------------------------------------#
	elsif ($fz =~ m/Invalid Querystring/i)
     {
         print BOLD, GREEN, "[!] ADO DB Invalid Querystring -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[ADO DB Query] $urlscan\n");
         }
     }
	elsif ($fz =~ m/ADODB.Field/i)
     {
         print BOLD, GREEN, "[!] ADO DB ADODB.Field -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[ADO DB Field] $urlscan\n");
         }
     }
	elsif ($fz =~ m/ADODB.Command/i )
     {
         print BOLD, GREEN, "[!] ADO DB ADODB.Command -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[ADO DB Command] $urlscan\n");
         }
     }
	elsif ($fz =~ m/BOF or EOF/i)
     {
         print BOLD, GREEN, "[!] ADO DB BOF or EOF -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[BOF or EOF] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      PostgreSQL                                           #
#-----------------------------------------------------------#
	elsif ($fz =~ m/postgresql.util/i || $fz =~ m/psql: FATAL/i || $fz =~ m/ERROR: invalid input syntax for integer/i )
     {
         print BOLD, GREEN, "[!] PosgreSQL -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL] $urlscan\n");
         }
     }
	elsif ($fz =~ m/dynamic_result_sets_returned/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 0100C -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 0100C] $urlscan\n");
         }
     }
	elsif ($fz =~ m/null_value_eliminated_in_set_function/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 1003 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 1003] $urlscan\n");
         }
     }

	elsif ($fz =~ m/string_data_right_truncation/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 1004 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 1004] $urlscan\n");
         }
     }
	elsif ($fz =~ m/deprecated_feature/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 01P01 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 01P01] $urlscan\n");
         }
     }
	elsif ($fz =~ m/sql_statement_not_yet_complete/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 3000 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 3000] $urlscan\n");
         }
     }
	elsif ($fz =~ m/connection_does_not_exist/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 8003 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 8003] $urlscan\n");
         }
     }

	elsif ($fz =~ m/connection_failure/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 8006 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 8006] $urlscan\n");
         }
     }

	elsif ($fz =~ m/sqlserver_rejected_establishment_of_sqlconnection/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 8004 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 8004] $urlscan\n");
         }
     }

	elsif ($fz =~ m/no_additional_dynamic_result_sets_returned/i)
     {
         print BOLD, GREEN, "[!] PostgreSQL: 2001 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PosgreSQL 2001] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      Oracle                                               #
#-----------------------------------------------------------#
	elsif ($fz =~ m/oracle.jdbc/i || $fz =~ m/system.data.oledb/i )
     {
         print BOLD, GREEN, "[!] JDBC -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[JDBC] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      Sybase                                               #
#-----------------------------------------------------------#
	elsif ($fz =~ m/Warning: sybase_query()/i || $fz =~ m/sybase_fetch_assoc()/i )
     {
         print BOLD, GREEN, "[!] Sybase Query/Fetch_Assoc -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[Sybase Query/Fetch_Assoc] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      MariaDB                                              #
#-----------------------------------------------------------#
	elsif ($fz =~ m/ERROR 1712 (HY000)/i )
     {
         print BOLD, GREEN, "[!] MariaDB Index Corruption -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[MariaDB Index] $urlscan\n");
         }
     }
	elsif ($fz =~ m/ER_QUERY_EXCEEDED_ROWS_EXAMINED_LIMIT/i )
     {
         print BOLD, GREEN, "[!] MariaDB Query Excecution Corrupted -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[MariaDB Query Exe] $urlscan\n");
         }
     }
	elsif ($fz =~ m/ER_QUERY_CACHE_IS_GLOBALY_DISABLED/i )
     {
         print BOLD, GREEN, "[!] MariaDB Query cache is globally disabled -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[MariaDB Query Cache] $urlscan\n");
         }
     }
	elsif ($fz =~ m/ER_DYN_COL_IMPLEMENTATION_LIMIT/i )
     {
         print BOLD, GREEN, "[!] MariaDB Dynamic column implementation limit -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[MariaDB Dynamic Col] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      IBM DB2                                              #
#-----------------------------------------------------------#
	elsif ($fz =~ m/The processing of the CONNECT statement at a DB2 remote server has failed/i)
     {
         print BOLD, GREEN, "[!] IBM DB2: 00D30021 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[DB2 00D30021] $urlscan\n");
         }
     }

	elsif ($fz =~ m/DB2 cannot connect to a group buffer pool/i)
     {
         print BOLD, GREEN, "[!] IBM DB2: 00C20203 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[DB2 00C20203] $urlscan\n");
         }
     }
	elsif ($fz =~ m/An error was detected in the command that was used to start the/i)
     {
         print BOLD, GREEN, "[!] IBM DB2: 00E80051 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[DB2 00E80051] $urlscan\n");
         }
     }
#-----------------------------------------------------------#
#      PHP PDO                                              #
#-----------------------------------------------------------#
	elsif ($fz =~ m/SQLSTATE[42000] [1049] Unknown database/i )
     {
         print BOLD, GREEN, "[!] PHP PDO: 1049 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PHP PDO 1049] $urlscan\n");
         }
     }
	elsif ($fz =~ m/SQLSTATE[28000] [1045] Access denied for user/i )
     {
         print BOLD, GREEN, "[!] PHP PDO: 1045 -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[PHP PDO 1045] $urlscan\n");
         }
     }

#-----------------------------------------------------------#
#      Command Injection (Testing)                          #
#-----------------------------------------------------------#
	elsif ($fz =~ m/cannot access sqlcutie: No such file or directory/i )
     {
         print BOLD, GREEN, "[!] Command Injection -> $urlscan\n", RESET;
         if (defined($vulnf))
         { 
             push (@vuln2,"[CI] $urlscan\n");
         }
     }

}
variables();
main();

if (defined($search_dork))
{
     print GREEN,BOLD,"[+] Dork        : ",YELLOW,"$search_dork\n";
		  print GREEN,"[+] Proxy       : ",YELLOW,"$proxy\n";
		  print GREEN,"[+] Output File : ",YELLOW,"$vulnf\n";
		  print YELLOW,"[!] Press Ctrl C to Exit\n";
		  print "[!] ",UNDERLINE,"Beware of False Positive\n\n",RESET;
     vulnscanner();
     if (defined($vulnf))
     {
	 
         open(vuln_file,">>$vulnf") ;
         print vuln_file @vuln1;
         print vuln_file @vuln2;
         print vuln_file @vuln3;
         close(vuln_file);
         print YELLOW,"[+] Result Saved to $vulnf\n",RESET;
         exit();
     }
}
#-----------------------------------------------------------#
#      End                                                  #
#-----------------------------------------------------------#
