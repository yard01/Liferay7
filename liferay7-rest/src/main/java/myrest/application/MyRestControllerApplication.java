package myrest.application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core. Context;

import org.osgi.framework.FrameworkUtil;
import org.osgi.service.component.annotations.Component;
 

@ApplicationPath("/greetings")
@Component(immediate = true, service = Application.class)
public class MyRestControllerApplication extends Application {

	public Set<Object> getSingletons() {
		return Collections.<Object>singleton(this);
	}

	@GET
	@Produces("text/plain")
	public String working() {
		return "It works!";
	}

	@GET
	@Path("/morning")
	@Produces("text/plain")
	public String hello() {
		return "Good morning!";
	}

	@GET
	@Path("/morning/{name}")
	@Produces("text/plain")
	public String morning(
		@PathParam("name") String name,
		@QueryParam("drink") String drink) {

		String greeting = "Good Morning " + name;

		if (drink != null) {
			greeting += ". Would you like some " + drink + "?";
		}

		return greeting;
	}

	@GET
	@Path("/test")
	@Produces("text/html")
	public String test() {
		String greeting = "<p>Hello World!</p>";
		//this.
		return greeting;
	}

	@GET
	@Path("/print")
	@Produces(MediaType.APPLICATION_OCTET_STREAM)
	public Response print() {
		File file = new File("/home/yard/test.txt");
		//String greeting = "<p>Hello World!</p>";
		//this.
		return Response.ok(file, MediaType.APPLICATION_OCTET_STREAM).header("Content-Disposition", "attachment; file=\""+file.getName()+"\"").build();
		
	}

	@GET
	@Path("/hi")
	@Produces(MediaType.TEXT_HTML)
	//@Content
	public InputStream hi() {		
		try {
			try {
				return FrameworkUtil.getBundle(this.getClass()).getResource("/hi_friend.html").openStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//new FileInputStream(file);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return null;
	}

}