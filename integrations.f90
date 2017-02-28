MODULE integrations
CONTAINS


SUBROUTINE forward(x0,y0,z0,x1,y1,z1,dt)
IMPLICIT NONE
REAL, INTENT(in) :: x0, y0, z0, dt
REAL, INTENT(out) :: x1, y1, z1

x1 = eqx(x0,y0,z0) * dt + x0
y1 = eqy(x0,y0,z0) * dt + y0
z1 = eqz(x0,y0,z0) * dt + z0

END SUBROUTINE forward


SUBROUTINE leapfrog(x0,y0,z0,x1,y1,z1,x2,y2,z2,dt)
IMPLICIT NONE
REAL, INTENT(in) :: x0, y0, z0, x1, y1, z1, dt
REAL, INTENT(out) :: x2, y2, z2

x2 = x0 + 2 * dt * eqx(x0,y0,z0)
y2 = y0 + 2 * dt * eqy(x0,y0,z0)
z2 = z0 + 2 * dt * eqz(x0,y0,z0)

END SUBROUTINE leapfrog


FUNCTION eqx(x,y,z)
IMPLICIT NONE
REAL, PARAMETER :: a = 10.0
REAL, INTENT(in) :: x, y, z
REAL :: eqx
eqx = a * ( y - x )

END FUNCTION eqx


FUNCTION eqy(x,y,z)
IMPLICIT NONE
REAL, PARAMETER :: b = 28.0
REAL, INTENT(in) :: x, y, z
REAL :: eqy
eqy = b * x - y - x * z

END FUNCTION eqy


FUNCTION eqz(x,y,z)
IMPLICIT NONE
REAL, PARAMETER :: c = 8.0 / 3.0
REAL, INTENT(in) :: x, y, z
REAL :: eqz
eqz = x * y - c * z

END FUNCTION eqz


END MODULE integrations
