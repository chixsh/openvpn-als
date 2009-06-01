
				/*
 *  OpenVPNALS
 *
 *  Copyright (C) 2003-2006 3SP LTD. All Rights Reserved
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2 of
 *  the License, or (at your option) any later version.
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public
 *  License along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
			
package net.openvpn.als.agent.client.util.types;

import java.text.MessageFormat;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * Accesor class for message resources for the VPN Client Application Type implementations.
 */
public class Messages {

    // Private statics
    private static ResourceBundle resourceBundle;

    private Messages() {
    }

    /**
     * Set the resource bundle.
     * 
     * @param resourceBundle bundle
     */
    public static void setBundle(ResourceBundle resourceBundle) {
        Messages.resourceBundle = resourceBundle;
    }

    /**
     * Get the localised string given its key.
     * 
     * @param key key
     * @return localised string
     */
    public static String getString(String key) {
        try {
        	if(resourceBundle == null) {
        		 resourceBundle = ResourceBundle.getBundle("net.openvpn.als.agent.client.util.types.ApplicationResources"); //$NON-NLS-1$
        	}
            return resourceBundle == null ? "*No resource bundle* !" + key + "!" : resourceBundle.getString(key); //$NON-NLS-1$ //$NON-NLS-2$
        } catch (MissingResourceException e) {
            return '!' + key + '!';
        }
    }
    
    public static String getString(String key, Object[] args) {
        return MessageFormat.format(getString(key), args);
    }
}