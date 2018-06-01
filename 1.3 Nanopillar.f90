Program Nanopillar
    ! This Program simulates a nanopillar on [111] plane in a FCC cubic which default size is 10x10x10
    ! Two .txt files will be generated, which can be used to plot a 3D diagram in Matlab with Nanopillar.m script
    ! Three parameters are user costomization: P_SIZE, SIZE, P_l
    ! P_SIZE means pillar radius
    ! P_l means pillar length
    ! SIZE is the size of the FCC cubic
    !--------------------------------------------------------------------------------------------------------------
    ! both P_SIZE and P_l should be smaller than SIZE to avoid errors
    !--------------------------------------------------------------------------------------------------------------
    
    ! The Program contains two main logic loop, and this two are nearly the same. Should just focus on one of them
    ! The first loop is only for counting numbers (not an elegant way though), and the second output all the results
    ! Main logic: Determine a center on each [111] layer and a radius. Then check all FCC points to find the pillar
    ! Center coordinate: (P_c/3, P_c/3, P_c/3)

    ! Start of Declaration
	Real :: M_x0 = 0.0, M_y0 = 0.0, M_z0 = 0.0  
	Real :: M_x, M_y, M_z
	Real :: i, j, k
    Integer :: M = 0, P = 0   ! # Counter
    Real, Parameter :: P_SIZE = 1.0     ! Pillar radius
    Real :: P_s                         ! initialize P_s = P_SIZE, set for while loop
    Real, Parameter :: SIZE = 10.0      ! FCC cubic SIZE (SIZE x SIZE x SIZE)
    Real :: P_l = 4.0              ! Pillar length, Warning: This should be smaller than Cubic Size
    Real :: P_c                         ! Pillar Center Coordinates
	Real, Parameter :: r_m = 1.0, r_p = (6.0**(1.0/2.0)/6.0)*P_SIZE   ! Calculate Pillar radius
	Real, Parameter :: e = 0.00001        ! This parameter prevents the result being misleaded from comparing floating point quantities
    ! End of Declaration

	! This loop counts the # of atoms: M, P
	Do i = 0.0, SIZE, 0.5
    	Do j = 0.0, SIZE, 0.5
        	Do k = 0.0, SIZE, 0.5
                if (abs(MOD(i/0.5, 2.0)-0.0)<=e .AND. abs(MOD(j/0.5, 2.0)-0.0)<=e .AND. abs(MOD(k/0.5, 2.0)-0.0)<=e) then
                ! Check if i,j,k are all integer  (Determine FCC point)
                	M_x = M_x0 + i*r_m
					M_y = M_y0 + j*r_m
        			M_z = M_z0 + k*r_m
                    M = M + 1
                    P_s = P_SIZE
                    P_c = (P_s-1.0)/3.0
                    Do while (P_c< P_l*4.0/3.0)
                      if ((M_x + M_y + M_z)/3.0 > P_SIZE/3.0  ) then
                      	if (((M_x - P_c)**2.0 + (M_y - P_c)**2.0 + (M_z - P_c)**2.0)**(1.0/2.0)<=r_p) then
                   	  	 P = P + 1
                      	EndIf
                      Endif
                      	 P_s = P_s + 1.0
                         P_c = (P_s-1.0)/3.0
                  	EndDo
                else if (abs(MOD((i+j+k)/0.5, 2.0)-0.0)<=e) then
                ! Check if two of i,j,k are floats & one is integer  (Determine FCC point)
                	M_x = M_x0 + i*r_m
					M_y = M_y0 + j*r_m
                    M_z = M_z0 + k*r_m
                    M = M + 1
                    P_s = P_SIZE
                    P_c = (P_s-1.0)/3.0
                    Do while (P_c< P_l*4.0/3.0)
                      if ((M_x + M_y + M_z)/3.0 > P_SIZE/3.0  ) then
                      	if (((M_x - P_c)**2.0 + (M_y - P_c)**2.0 + (M_z - P_c)**2.0)**(1.0/2.0)<=r_p) then
                   	  	 P = P + 1
                      	EndIf
                      Endif
                      	 P_s = P_s + 1.0
                         P_c = (P_s-1.0)/3.0
                  	EndDo
                EndIf
			EndDo
        EndDo
    EndDo
                
	Open(10, file="Nanopillar_M.txt", STATUS="UNKNOWN") ! Open File at Unit = 10
    Open(11, file="Nanopillar_P.txt", STATUS="UNKNOWN") ! Open File at Unit = 10
    Write(10, *) M    
    Write(10, *) " # =          ", "M_x =      ", "M_y =      ", "M_z =  "   ! Headerlines	
    Write(11, *) P
    Write(11, *) " # =          ", "P_x =      ", "P_y =      ", "P_z =  "   ! Headerlines	 

    M = 0
    P = 0
    
  	! Warning
	if (P_l > SIZE) then
    	Write(*,*) "Warning: Pillar length ", P_l, " Should be Smaller than Cubic Size ", SIZE 
    EndIf
	
	! Main logic of Program
	Do i = 0.0, SIZE, 0.5
    	Do j = 0.0, SIZE, 0.5
        	Do k = 0.0, SIZE, 0.5
                if (abs(MOD(i/0.5, 2.0)-0.0)<=e .AND. abs(MOD(j/0.5, 2.0)-0.0)<=e .AND. abs(MOD(k/0.5, 2.0)-0.0)<=e) then
                ! Check if i,j,k are all integer  (Determine FCC point)
                	M_x = M_x0 + i*r_m
					M_y = M_y0 + j*r_m
        			M_z = M_z0 + k*r_m
                    M = M + 1
                    Write(10, "(I10)", ADVANCE="NO") M
                    Write(10, "(2X, F10.1)", ADVANCE="NO") M_x
                    Write(10, "(2X, F10.1)", ADVANCE="NO") M_y
                    Write(10, "(2X, F10.1)", ADVANCE="YES") M_z
                    P_s = P_SIZE
                    P_c = (P_s-1.0)/3.0
                    Do while (P_c< P_l*4.0/3.0)
                      if ((M_x + M_y + M_z)/3.0 > P_SIZE/3.0  ) then
                      	if (((M_x - P_c)**2.0 + (M_y - P_c)**2.0 + (M_z - P_c)**2.0)**(1.0/2.0)<=r_p) then
                   	  	 P = P + 1
                      	 Write(11, "(I10)", ADVANCE="NO") P
					  	 Write(11, "(2X, F10.1)", ADVANCE="NO") M_x
                      	 Write(11, "(2X, F10.1)", ADVANCE="NO") M_y
                      	 Write(11, "(2X, F10.1)", ADVANCE="YES") M_z
                      	EndIf
                      Endif
                      	 P_s = P_s + 1.0
                         P_c = (P_s-1.0)/3.0
                  	EndDo
                else if (abs(MOD((i+j+k)/0.5, 2.0)-0.0)<=e) then
                ! Check if two of i,j,k are floats & one is integer  (Determine FCC point)
                	M_x = M_x0 + i*r_m
					M_y = M_y0 + j*r_m
                    M_z = M_z0 + k*r_m
                    M = M + 1
                    Write(10, "(I10)", ADVANCE="NO") M
                    Write(10, "(2X, F10.1)", ADVANCE="NO") M_x
                    Write(10, "(2X, F10.1)", ADVANCE="NO") M_y
                    Write(10, "(2X, F10.1)", ADVANCE="YES") M_z
                    P_s = P_SIZE
                    P_c = (P_s-1.0)/3.0
                    Do while (P_c< P_l*4.0/3.0)
                   	   if ((M_x + M_y + M_z)/3.0 > P_SIZE/3.0 ) then
                     	 
                     	if (((M_x - P_c)**2.0 + (M_y - P_c)**2.0 + (M_z - P_c)**2.0)**(1.0/2.0)<=r_p) then
                   	  		P = P + 1
                     		Write(11, "(I10)", ADVANCE="NO") P
							Write(11, "(2X, F10.1)", ADVANCE="NO") M_x
                	        Write(11, "(2X, F10.1)", ADVANCE="NO") M_y
                      		Write(11, "(2X, F10.1)", ADVANCE="YES") M_z
                     	EndIf
                      Endif
                     	P_s = P_s + 1.0
                        P_c = (P_s-1.0)/3.0
                  	EndDo

                EndIf
			EndDo
        EndDo
    EndDo
	Close(10)
    Close(11)
Stop
End


