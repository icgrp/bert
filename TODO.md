***Cleanup for FCCM***

 *  separate out submodule for the Xilinx project (brent)
    *    (reduce initial download to 10s of MB vs. 350MB)
    * 2 branches
    	* xilfpgaless --> can go way
    	* write_to_file ... can we merge in? (just don't expect to work,   yet)
    * still some next steps		
 * copyappfiles ... need argument for sw_huffman_{sdk,vitis} (matthew)
 * ? docs/tutorials/huffman/sw_huffman_{sdk,vitis} combine --> done
      * hellobert.c different -- why? ... named different? (only difference)
           * ifdef or some such to combine... in mydesign because it is different...but mydesign generated?
      * combined, but not dealing with different hellobert.c
	  * need to keep two copies of hellobert.c
	  * maybe copyapp files can take care of it?
 * host_tools/file_gen/ -- there are two .tcl --> combine?
     * can we get vitis/sdk to report itself, then could condition
 * v3 compression (andre)
 * [after cleanup ... rerun tutorials...regression...]
    * 2018.3
    * 2019.2
	* 2020.2

***Done***
 * paper in repo (once have final camera-ready PDF, andre)
 * remove embedded/libsrc --> all moved and updated (matthew)
 * docs/tutorials/huffman/hw_huffman_{sdk,vitis} combine
     * need xsa vs hdf -- keep separate
 * cleanup copyapps files
	*  docs/tutorials/huffman/copyappfiles*.py (matthew)
    * comments in script
    * tutorial -- associated instructions
    *  unify
 * python files for bsps can go away? (matthew)
    *   docs/tutorials/huffman/coppybspfiles*.py
 * Vitis/vivado versions... (tutorial now for 2019.2 ... basic vitis?)
    * did get working with 2020.2 
