{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SNS.SetSubscriptionAttributes
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

-- | Allows a subscription owner to set an attribute of the topic to a new
-- value.
--
-- <http://docs.aws.amazon.com/sns/latest/api/API_SetSubscriptionAttributes.html>
module Network.AWS.SNS.SetSubscriptionAttributes
    (
    -- * Request
      SetSubscriptionAttributes
    -- ** Request constructor
    , setSubscriptionAttributes
    -- ** Request lenses
    , ssaAttributeValue
    , ssaSubscriptionARN
    , ssaAttributeName

    -- * Response
    , SetSubscriptionAttributesResponse
    -- ** Response constructor
    , setSubscriptionAttributesResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SNS.Types

-- | /See:/ 'setSubscriptionAttributes' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ssaAttributeValue'
--
-- * 'ssaSubscriptionARN'
--
-- * 'ssaAttributeName'
data SetSubscriptionAttributes = SetSubscriptionAttributes'{_ssaAttributeValue :: Maybe Text, _ssaSubscriptionARN :: Text, _ssaAttributeName :: Text} deriving (Eq, Read, Show)

-- | 'SetSubscriptionAttributes' smart constructor.
setSubscriptionAttributes :: Text -> Text -> SetSubscriptionAttributes
setSubscriptionAttributes pSubscriptionARN pAttributeName = SetSubscriptionAttributes'{_ssaAttributeValue = Nothing, _ssaSubscriptionARN = pSubscriptionARN, _ssaAttributeName = pAttributeName};

-- | The new value for the attribute in JSON format.
ssaAttributeValue :: Lens' SetSubscriptionAttributes (Maybe Text)
ssaAttributeValue = lens _ssaAttributeValue (\ s a -> s{_ssaAttributeValue = a});

-- | The ARN of the subscription to modify.
ssaSubscriptionARN :: Lens' SetSubscriptionAttributes Text
ssaSubscriptionARN = lens _ssaSubscriptionARN (\ s a -> s{_ssaSubscriptionARN = a});

-- | The name of the attribute you want to set. Only a subset of the
-- subscriptions attributes are mutable.
--
-- Valid values: @DeliveryPolicy@ | @RawMessageDelivery@
ssaAttributeName :: Lens' SetSubscriptionAttributes Text
ssaAttributeName = lens _ssaAttributeName (\ s a -> s{_ssaAttributeName = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest SetSubscriptionAttributes where
        type Sv SetSubscriptionAttributes = SNS
        type Rs SetSubscriptionAttributes =
             SetSubscriptionAttributesResponse
        request = post
        response
          = receiveNull SetSubscriptionAttributesResponse'

instance ToHeaders SetSubscriptionAttributes where
        toHeaders = const mempty

instance ToPath SetSubscriptionAttributes where
        toPath = const "/"

instance ToQuery SetSubscriptionAttributes where
        toQuery SetSubscriptionAttributes'{..}
          = mconcat
              ["Action" =:
                 ("SetSubscriptionAttributes" :: ByteString),
               "Version" =: ("2010-03-31" :: ByteString),
               "AttributeValue" =: _ssaAttributeValue,
               "SubscriptionArn" =: _ssaSubscriptionARN,
               "AttributeName" =: _ssaAttributeName]

-- | /See:/ 'setSubscriptionAttributesResponse' smart constructor.
data SetSubscriptionAttributesResponse = SetSubscriptionAttributesResponse' deriving (Eq, Read, Show)

-- | 'SetSubscriptionAttributesResponse' smart constructor.
setSubscriptionAttributesResponse :: SetSubscriptionAttributesResponse
setSubscriptionAttributesResponse = SetSubscriptionAttributesResponse';
