////////////////////////////////////////////////////////////////////////////////
//    Copyright (c) Open Connectivity Foundation (OCF), AllJoyn Open Source
//    Project (AJOSP) Contributors and others.
//
//    SPDX-License-Identifier: Apache-2.0
//
//    All rights reserved. This program and the accompanying materials are
//    made available under the terms of the Apache License, Version 2.0
//    which accompanies this distribution, and is available at
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Copyright (c) Open Connectivity Foundation and Contributors to AllSeen
//    Alliance. All rights reserved.
//
//    Permission to use, copy, modify, and/or distribute this software for
//    any purpose with or without fee is hereby granted, provided that the
//    above copyright notice and this permission notice appear in all
//    copies.
//
//    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
//    WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
//    AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
//    DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
//    PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
//    TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
//    PERFORMANCE OF THIS SOFTWARE.
////////////////////////////////////////////////////////////////////////////////

#import <alljoyn/Status.h>
#import "AJNHandle.h"

/**
 * An application can provide a key store listener to override the default key store Load and Store
 * behavior. This will override the default key store behavior.
 */
@protocol AJNKeyStoreListener <NSObject>

@required

/**
 * This method is called when a key store needs to be loaded.
 * @remark The application must call <tt>#PutKeys</tt> to put the new key store data into the
 * internal key store.
 *
 * @param keyStore   Reference to the KeyStore to be loaded.
 *
 * @return  - ER_OK if the load request was satisfied
 *          - An error status otherwise
 *
 */
- (QStatus)load:(AJNHandle)keyStore;

/**
 * This method is called when a key store needs to be stored.
 * @remark The application must call <tt>#GetKeys</tt> to obtain the key data to be stored.
 *
 * @param keyStore   Reference to the KeyStore to be stored.
 *
 * @return  - ER_OK if the store request was satisfied
 *          - An error status otherwise
 */
- (QStatus)store:(AJNHandle)keyStore;

/**
 * Get the current keys from the key store as an encrypted byte string.
 *
 * @param keyStore  The keyStore to get from. This is the keystore indicated in the StoreRequest call.
 * @param sink      The byte string to write the keys to.
 * @return  - ER_OK if successful
 *          - An error status otherwise
 */
- (QStatus)getKeys:(AJNHandle) keyStore sink:(NSString *)sink;

/**
 * Put keys into the key store from an encrypted byte string.
 *
 * @param keyStore  The keyStore to put to. This is the keystore indicated in the LoadRequest call.
 * @param source    The byte string containing the encrypted key store contents.
 * @param password  The password required to decrypt the key data
 *
 * @return  - ER_OK if successful
 *          - An error status otherwise
 *
 */
- (QStatus)putKeys:(AJNHandle) keyStore source:(NSString *)source password:(NSString *)password;

/**
 * Request to acquire exclusive lock (e.g., file lock) on the keyStore.
 *
 * @remark Best practice is to call `AcquireExclusiveLock(MUTEX_CONTEXT)`
 *
 * @see MUTEX_CONTEXT
 *
 * @param file the name of the file this lock was called from
 * @param line the line number of the file this lock was called from
 *
 * @return
 *      - ER_OK if successful
 *      - An error status otherwise
 */
- (QStatus)acquireExclusiveLock:(NSString *)file line:(uint32_t)line;

/**
 * Release the exclusive lock (e.g., file lock) of the keyStore.
 *
 * @remark Best practice is to call `ReleaseExclusiveLock(MUTEX_CONTEXT)`
 *
 * @see MUTEX_CONTEXT
 *
 * @param file the name of the file this lock was called from
 * @param line the line number of the file this lock was called from
 *
 */
- (QStatus)releaseExclusiveLock:(NSString *)file line:(uint32_t)line;


@end
