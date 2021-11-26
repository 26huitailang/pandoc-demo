FROM pandoc/core:2.16.2

ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN mkdir /tmp/install-tl-unx
WORKDIR /tmp/install-tl-unx
COPY texlive.profile .
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# Install TeX Live
RUN apk --no-cache add perl \
	wget \
	nodejs \
	npm \
	chromium \
	font-noto \
	xz tar && \
	wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	tar --strip-components=1 -xvf install-tl-unx.tar.gz && \
	./install-tl --profile=texlive.profile && \
	apk del perl wget xz tar && \
	cd && rm -rf /tmp/install-tl-unx

# filters
RUN PUPPETEER_SKIP_DOWNLOAD='true' npm install --global mermaid-filter

COPY msyh.ttf /usr/share/fonts/truetype/
RUN fc-cache -fv
WORKDIR /data

# Install basic collection and additional packages
RUN apk --no-cache add perl wget && \
	tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet && \
	tlmgr update --self
RUN tlmgr install adjustbox background bidi csquotes footmisc footnotebackref fvextra mdframed pagecolor sourcecodepro sourcesanspro titling ulem upquote xurl
# trial and error
RUN tlmgr install letltxmacro zref everypage framed collectbox
# packages needed for the template
RUN tlmgr install xecjk filehook unicode-math ucharcat pagecolor babel-german ly1 mweights sourcecodepro sourcesanspro mdframed needspace fvextra footmisc footnotebackref background
# packages only needed for some examples (that include packages via header-includes)
RUN tlmgr install awesomebox fontawesome5
# packages only needed for some examples (example boxes-with-pandoc-latex-environment-and-tcolorbox)
RUN tlmgr install tcolorbox pgf etoolbox environ trimspaces

RUN mkdir /config
COPY .puppeteer.json /config/.puppeteer.json

# post
RUN apk del wget && \
	rm -rf /var/cache/apk/*
