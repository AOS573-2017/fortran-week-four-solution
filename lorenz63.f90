PROGRAM lorenz63
USE integrations
IMPLICIT NONE

! Variables
INTEGER :: i       !For loop
INTEGER :: N       !Number of cycles
REAL :: dt         !Integration step length
REAL :: x0, y0, z0, x1, y1, z1  !current and next model state
REAL :: x2, y2, z2

!Set the initial conditions and parameters
!x0 = 0
!y0 = 0
!z0 = 0
!dt = 0.01
N = 100000

OPEN(UNIT=7, FILE='params', ACTION='read')
READ(7,*) x0
READ(7,*) y0
READ(7,*) z0
READ(7,*) dt
CLOSE(UNIT=7)

!Open a file to write the output of the model
OPEN(UNIT=8, FILE='lorenz63.txt', ACTION='write')
WRITE(8,*) x0, y0, z0

! Generate second initial conditions
CALL forward(x0,y0,z0,x1,y1,z1,dt)

! Now loop with leapfrog
DO i = 1, N
  CALL leapfrog(x0,y0,z0,x1,y1,z1,x2,y2,z2,dt)
  x0 = x1
  y0 = y1
  z0 = z1
  x1 = x2
  y1 = y2
  z1 = z2
  WRITE(8,*) x0, y0, z0
END DO

CLOSE(UNIT=8)

END PROGRAM lorenz63
