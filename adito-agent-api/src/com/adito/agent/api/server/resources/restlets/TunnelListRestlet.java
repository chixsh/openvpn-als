/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.adito.agent.api.server.resources.restlets;

import com.adito.agent.api.objects.Shutdown;
import com.adito.agent.api.objects.TunnelList;
import com.adito.agent.api.server.APIApplication;
import java.io.IOException;
import java.io.OutputStream;
import javax.xml.bind.JAXBException;
import javax.xml.namespace.QName;
import org.restlet.Restlet;
import org.restlet.data.MediaType;
import org.restlet.data.Request;
import org.restlet.data.Response;
import org.restlet.resource.Representation;
import org.restlet.resource.XmlRepresentation;

/**
 *
 * @author Matthias Jansen / Jansen-Systems
 */
public class TunnelListRestlet extends Restlet {

    @Override
    public void handle(Request request, Response response) {
	// super.handle(request, response);
	// TODO: invoke shutdown here....
	Representation r = new XmlRepresentation(MediaType.TEXT_XML) {

	    @Override
	    public Object evaluate(String string, QName qname) throws Exception {
		// throw new UnsupportedOperationException("Not supported yet.");
		System.out.println("String: "+string);
		System.out.println("qname: "+qname.toString());
		return null;
	    }

	    @Override
	    public void write(OutputStream out) throws IOException {
		// throw new UnsupportedOperationException("Not supported yet.");
		TunnelList t = new TunnelList();
		// TODO: get the real list
		t.getTunnels().add("Tunnel 1");
		t.getTunnels().add("Tunnel 2");
		t.getTunnels().add("Tunnel 3");
		try {
		    APIApplication.getInstance().getMarshaller().marshal(t, out);
		} catch (JAXBException ex) {
		    // Logger.getLogger(ShutdownResource.class.getName()).log(Level.SEVERE, null, ex);
		    ex.printStackTrace();
		}
	    }
	};
	response.setEntity(r);
    }


}
