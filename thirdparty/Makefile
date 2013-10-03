all:
	@echo "making third party libs"
	cd TooN && make
	cd libcvd && make
	cd gvars3 && make
	cd lib3ds && make


distclean:
	@echo "cleaning up third party libs and doing a fresh checkout"
	-cd TooN && make clean  
	-cd libcvd && make distclean  
	-cd gvars3 && make distclean 
	-cd lib3ds && make distclean

clean:
	@echo "cleaning up third party libs without doing a fresh checkout"
	#cd TooN && make clean  #TooN is header only
	-cd libcvd && make clean  
	-cd gvars3 && make clean 
	-cd lib3ds && make clean


