/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package reflection;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Nick
 */
public class Reflection {

    /**
     * @param args the command line arguments
     * @throws UnsupportedEncodingException 
     * @throws FileNotFoundException 
     * @throws ClassNotFoundException 
     */
    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException, ClassNotFoundException{
    	String c = null;
    	String directory = null;
		if (args.length != 2) System.out.println("missing arguments, please try again"); 
		else{
			c = args[0];//Class.forName(args[0]);
			directory = args[1];
//			System.out.println(c.getName());
//			System.out.println(directory);
			File path = new File(directory);
			ArrayList<File> files = getDirectoryFiles(path);
//			System.out.println(files.toString());
			createOutput(c, files);
		}
    }
    public static void createOutput(String className, ArrayList<File> files) throws FileNotFoundException, UnsupportedEncodingException, ClassNotFoundException {
    	PrintWriter output = new PrintWriter("output.txt", "UTF-8");
    	output.println(":- discontiguous bcClass/3, bcMember/7.");
    	output.println(":- dynamic bcClass/3, bcMember/7.");
    	int ccount = 0;
    	int mcount = 0;
		ArrayList<Class> classes = new ArrayList<Class>();
    	for (File file : files){
    		String filename = file.getName();
    		if (filename.endsWith(".class")){
    			String classconcat = className + "." + file.getName().substring(0, file.getName().length() - 6);
    			Class c = Class.forName(classconcat);
    			classes.add(c);
    		}
    	}
    	/*process classes*/
    	for (Class c : classes){
    		output.println("\nbcClass(c" + ccount + ", '" + c.getName() + "', '" + c.getSuperclass().getSimpleName() + "').");
    		output.println();
    		if (c.getConstructors().length > 0){
    			output.println("/* public Constructors */");
    			Constructor[] constructors = c.getDeclaredConstructors();
    			//Method[] methods = c.getMethods();
    			for (Constructor cons : constructors){
//	    			System.out.println(cons.toGenericString());
//	    			System.out.println(!Modifier.isStatic(cons.getModifiers()));
    				output.println("bcMember(m" + mcount + ", c" + ccount + ", true, false, " + c.getName() + "'', '" + cons.getName());
    			}
    			
    		}
    		ccount++;
    	}
    	output.close();
	}
	public static ArrayList<File> getDirectoryFiles(File dir) {
		File[] files = dir.listFiles();
		ArrayList<File> result = new ArrayList<File>();
		for (File file : files) {
			if (file.isDirectory()) {
				result.add(file);
				result.addAll(getDirectoryFiles(file));
			}
			else {
				result.add(file);
			}
		}
		return result;
	}

}
