import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;

import java.beans.Transient;

import static edu.gvsu.mipsunit.munit.MUnit.*;

public class BranchTest {


    /******************************************************************
     *
     * Test makes10
     *
     *****************************************************************/

    @Test 
    public void makes10_aIs10() {
	    run("makes10", 10, 3);
	    Assert.assertEquals(1, get(v0));
    }

    @Test
    public void makes10_bIs10(){
        run("makes10", 5, 10);
        Assert.assertEquals(1, get(v0));
    }

    @Test
    public void makes10_sumIs10(){
        run("makes10", 5, 5);
        Assert.assertEquals(1, get(v0));
    }

    @Test
    public void makes10_sumNot10(){
        run("makes10", 3, 6);
        Assert.assertEquals(0, get(v0));
    }

    // Write more tests!


    /******************************************************************
     *
     * Test intMax
     *
     *****************************************************************/

    @Test 
    public void intMax_ascending() {
	    run("intMax", 5, 6, 7);
	    Assert.assertEquals(7, get(v0));
    }

    // Write more tests!

    /******************************************************************
     *
     * Test close10
     *
     *****************************************************************/

    @Test 
    public void close10_aClosest() {
	    run("close10", 8, 13);
	    Assert.assertEquals(8, get(v0));
    }

    // Write more tests!


    /******************************************************************
     *
     * Test dateFashion
     *
     *****************************************************************/

    @Test 
    public void dateFashion_youOk_dateStylish() {
	    run("dateFashion", 5, 10);
	    Assert.assertEquals(2, get(v0));
    }

    // Write more tests!


} // end class

