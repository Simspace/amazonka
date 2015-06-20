{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.IAM.UpdateOpenIDConnectProviderThumbprint
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

-- | Replaces the existing list of server certificate thumbprints with a new
-- list.
--
-- The list that you pass with this action completely replaces the existing
-- list of thumbprints. (The lists are not merged.)
--
-- Typically, you need to update a thumbprint only when the identity
-- provider\'s certificate changes, which occurs rarely. However, if the
-- provider\'s certificate /does/ change, any attempt to assume an IAM role
-- that specifies the OIDC provider as a principal will fail until the
-- certificate thumbprint is updated.
--
-- Because trust for the OpenID Connect provider is ultimately derived from
-- the provider\'s certificate and is validated by the thumbprint, it is a
-- best practice to limit access to the
-- @UpdateOpenIDConnectProviderThumbprint@ action to highly-privileged
-- users.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateOpenIDConnectProviderThumbprint.html>
module Network.AWS.IAM.UpdateOpenIDConnectProviderThumbprint
    (
    -- * Request
      UpdateOpenIDConnectProviderThumbprint
    -- ** Request constructor
    , updateOpenIDConnectProviderThumbprint
    -- ** Request lenses
    , uoidcptOpenIDConnectProviderARN
    , uoidcptThumbprintList

    -- * Response
    , UpdateOpenIDConnectProviderThumbprintResponse
    -- ** Response constructor
    , updateOpenIDConnectProviderThumbprintResponse
    ) where

import Network.AWS.IAM.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updateOpenIDConnectProviderThumbprint' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'uoidcptOpenIDConnectProviderARN'
--
-- * 'uoidcptThumbprintList'
data UpdateOpenIDConnectProviderThumbprint = UpdateOpenIDConnectProviderThumbprint'{_uoidcptOpenIDConnectProviderARN :: Text, _uoidcptThumbprintList :: [Text]} deriving (Eq, Read, Show)

-- | 'UpdateOpenIDConnectProviderThumbprint' smart constructor.
updateOpenIDConnectProviderThumbprint :: Text -> UpdateOpenIDConnectProviderThumbprint
updateOpenIDConnectProviderThumbprint pOpenIDConnectProviderARN = UpdateOpenIDConnectProviderThumbprint'{_uoidcptOpenIDConnectProviderARN = pOpenIDConnectProviderARN, _uoidcptThumbprintList = mempty};

-- | The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider
-- to update the thumbprint for. You can get a list of OIDC provider ARNs
-- by using the ListOpenIDConnectProviders action.
uoidcptOpenIDConnectProviderARN :: Lens' UpdateOpenIDConnectProviderThumbprint Text
uoidcptOpenIDConnectProviderARN = lens _uoidcptOpenIDConnectProviderARN (\ s a -> s{_uoidcptOpenIDConnectProviderARN = a});

-- | A list of certificate thumbprints that are associated with the specified
-- IAM OpenID Connect provider. For more information, see
-- CreateOpenIDConnectProvider.
uoidcptThumbprintList :: Lens' UpdateOpenIDConnectProviderThumbprint [Text]
uoidcptThumbprintList = lens _uoidcptThumbprintList (\ s a -> s{_uoidcptThumbprintList = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest
         UpdateOpenIDConnectProviderThumbprint where
        type Sv UpdateOpenIDConnectProviderThumbprint = IAM
        type Rs UpdateOpenIDConnectProviderThumbprint =
             UpdateOpenIDConnectProviderThumbprintResponse
        request = post
        response
          = receiveNull
              UpdateOpenIDConnectProviderThumbprintResponse'

instance ToHeaders
         UpdateOpenIDConnectProviderThumbprint where
        toHeaders = const mempty

instance ToPath UpdateOpenIDConnectProviderThumbprint
         where
        toPath = const "/"

instance ToQuery
         UpdateOpenIDConnectProviderThumbprint where
        toQuery UpdateOpenIDConnectProviderThumbprint'{..}
          = mconcat
              ["Action" =:
                 ("UpdateOpenIDConnectProviderThumbprint" ::
                    ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "OpenIDConnectProviderArn" =:
                 _uoidcptOpenIDConnectProviderARN,
               "ThumbprintList" =:
                 toQueryList "member" _uoidcptThumbprintList]

-- | /See:/ 'updateOpenIDConnectProviderThumbprintResponse' smart constructor.
data UpdateOpenIDConnectProviderThumbprintResponse = UpdateOpenIDConnectProviderThumbprintResponse' deriving (Eq, Read, Show)

-- | 'UpdateOpenIDConnectProviderThumbprintResponse' smart constructor.
updateOpenIDConnectProviderThumbprintResponse :: UpdateOpenIDConnectProviderThumbprintResponse
updateOpenIDConnectProviderThumbprintResponse = UpdateOpenIDConnectProviderThumbprintResponse';
