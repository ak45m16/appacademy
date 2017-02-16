package test
import doodle.core._
import doodle.syntax._
import doodle.jvm.Java2DCanvas._
import doodle.backend.StandardInterpreter._
import doodle.examples._


object Test {
  def triangleConstruction(): Image =
    Triangle(10,10) above (Triangle(10, 10) beside Triangle(10,10))

  def sierpinski(n: Int): Image =
    if(n == 1) {
      Triangle(10, 10)
    } else {
      val smaller = sierpinski(n-1)
      smaller above (smaller beside smaller)
    }
}

/** Notes
 *  each level of recursing produces 3x the prior level
 *  can be optimized to only use one triangle object for performance
 *  provide more details as to how this works and what it does.
 */
