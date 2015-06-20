{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CognitoIdentity.DeleteIdentities
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Deletes identities from an identity pool. You can specify a list of 1-60
-- identities that you want to delete.
--
-- You must use AWS Developer credentials to call this API.
--
-- <http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_DeleteIdentities.html>
module Network.AWS.CognitoIdentity.DeleteIdentities
    (
    -- * Request
      DeleteIdentities
    -- ** Request constructor
    , deleteIdentities
    -- ** Request lenses
    , diIdentityIdsToDelete

    -- * Response
    , DeleteIdentitiesResponse
    -- ** Response constructor
    , deleteIdentitiesResponse
    -- ** Response lenses
    , dirUnprocessedIdentityIds
    ) where

import Network.AWS.CognitoIdentity.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteIdentities' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'diIdentityIdsToDelete'
newtype DeleteIdentities = DeleteIdentities'{_diIdentityIdsToDelete :: List1 Text} deriving (Eq, Read, Show)

-- | 'DeleteIdentities' smart constructor.
deleteIdentities :: NonEmpty Text -> DeleteIdentities
deleteIdentities pIdentityIdsToDelete = DeleteIdentities'{_diIdentityIdsToDelete = _List1 # pIdentityIdsToDelete};

-- | A list of 1-60 identities that you want to delete.
diIdentityIdsToDelete :: Lens' DeleteIdentities (NonEmpty Text)
diIdentityIdsToDelete = lens _diIdentityIdsToDelete (\ s a -> s{_diIdentityIdsToDelete = a}) . _List1;

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DeleteIdentities where
        type Sv DeleteIdentities = CognitoIdentity
        type Rs DeleteIdentities = DeleteIdentitiesResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DeleteIdentitiesResponse' <$>
                   (x .?> "UnprocessedIdentityIds" .!@ mempty))

instance ToHeaders DeleteIdentities where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWSCognitoIdentityService.DeleteIdentities" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteIdentities where
        toJSON DeleteIdentities'{..}
          = object
              ["IdentityIdsToDelete" .= _diIdentityIdsToDelete]

instance ToPath DeleteIdentities where
        toPath = const "/"

instance ToQuery DeleteIdentities where
        toQuery = const mempty

-- | /See:/ 'deleteIdentitiesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dirUnprocessedIdentityIds'
newtype DeleteIdentitiesResponse = DeleteIdentitiesResponse'{_dirUnprocessedIdentityIds :: Maybe [UnprocessedIdentityId]} deriving (Eq, Read, Show)

-- | 'DeleteIdentitiesResponse' smart constructor.
deleteIdentitiesResponse :: DeleteIdentitiesResponse
deleteIdentitiesResponse = DeleteIdentitiesResponse'{_dirUnprocessedIdentityIds = Nothing};

-- | An array of UnprocessedIdentityId objects, each of which contains an
-- ErrorCode and IdentityId.
dirUnprocessedIdentityIds :: Lens' DeleteIdentitiesResponse [UnprocessedIdentityId]
dirUnprocessedIdentityIds = lens _dirUnprocessedIdentityIds (\ s a -> s{_dirUnprocessedIdentityIds = a}) . _Default;
