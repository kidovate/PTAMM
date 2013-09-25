all: lib3ds_download lib3ds_built

lib3ds_download:
	wget https://lib3ds.googlecode.com/files/lib3ds-20080909.zip
	7z x lib3ds-*.zip
	rm lib3ds-*.zip
	-rm -rf lib3ds
	mv lib3ds-* lib3ds
	touch lib3ds

distclean:
	-rm -rf lib3ds
	-rm lib3ds_built
	
clean:
	cd lib3ds && make clean

lib3ds_built:
	cd lib3ds && ./configure && make -j8
	touch lib3ds_built
