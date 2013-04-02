#!/bin/sh

rm *.html

cp installation.tex index.tex
#sed -i 's/\\vspace{[^}]*}//' index.tex
sed -i -e 's/\\begin{lstlisting}\[language=sh\]/\\begin{verbatim}/' -e 's/\end{lstlisting}%%%/\end{verbatim}/' index.tex
htlatex index.tex "html,3,next" && echo -e "\n\n\n"

	sed -i 's/<\/h3>/<hr><\/h3>/g' index.html
	sed -i 's/\&#x00A0;<span class=\"subsectionToc/\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;<span class=\"subsectionToc/' index.html
	sed -i 's/\&#x00A0;<span class=\"subsubsectionToc/\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;\&#x00A0;<span class=\"subsectionToc/' index.html

sed -i '/<p class=\"noindent\" ><hr class=\"float\"><div class=\"float\"/{n;d;}' index.html
sed -i '/<p class=\"noindent\" ><hr class=\"float\"><div class=\"float\"/d' index.html	
sed -i 's/<\/div><hr class=\"endfloat\" \/>//' index.html

mv index.html instructions.html
rm index.*
cd html/
firefox instructions.html &