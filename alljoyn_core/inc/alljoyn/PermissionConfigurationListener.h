/**
 * @file
 * Contains the PermissionConfigurationListener class
 */
/******************************************************************************
 *  * Copyright (c) Open Connectivity Foundation (OCF) and AllJoyn Open
 *    Source Project (AJOSP) Contributors and others.
 *
 *    SPDX-License-Identifier: Apache-2.0
 *
 *    All rights reserved. This program and the accompanying materials are
 *    made available under the terms of the Apache License, Version 2.0
 *    which accompanies this distribution, and is available at
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Copyright (c) Open Connectivity Foundation and Contributors to AllSeen
 *    Alliance. All rights reserved.
 *
 *    Permission to use, copy, modify, and/or distribute this software for
 *    any purpose with or without fee is hereby granted, provided that the
 *    above copyright notice and this permission notice appear in all
 *    copies.
 *
 *     THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
 *     WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
 *     WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
 *     AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
 *     DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 *     PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 *     TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 *     PERFORMANCE OF THIS SOFTWARE.
 ******************************************************************************/
#ifndef _ALLJOYN_PERMISSIONCONFIGURATIONLISTENER_H
#define _ALLJOYN_PERMISSIONCONFIGURATIONLISTENER_H

#include <alljoyn/Status.h>

namespace ajn {

/**
 * Abstract base class implemented by AllJoyn users and called by AllJoyn to
 * inform users of security permission related events.
 */
class PermissionConfigurationListener {
  public:
    /**
     * PermissionConfigurationListener constructor.
     */
    PermissionConfigurationListener() { }

    /**
     * PermissionConfigurationListener destructor.
     */
    virtual ~PermissionConfigurationListener() { }

    /**
     * Handler for doing a factory reset of application state.
     *
     * @return  Return ER_OK if the application state reset was successful.
     */
    virtual QStatus FactoryReset()
    {
        return ER_NOT_IMPLEMENTED;
    }

    /**
     * Notification that the security manager has updated the security policy
     * for the application.
     */
    virtual void PolicyChanged()
    {
    }

    /**
     * Notification provided before Security Manager is starting to change settings for this application.
     */
    virtual void StartManagement()
    {
    }

    /**
     * Notification provided after Security Manager finished changing settings for this application.
     */
    virtual void EndManagement()
    {
    }
};
}
#endif //_ALLJOYN_PERMISSIONCONFIGURATIONLISTENER_H