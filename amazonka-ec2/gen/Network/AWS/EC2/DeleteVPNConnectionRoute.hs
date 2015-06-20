{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.DeleteVPNConnectionRoute
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

-- | Deletes the specified static route associated with a VPN connection
-- between an existing virtual private gateway and a VPN customer gateway.
-- The static route allows traffic to be routed from the virtual private
-- gateway to the VPN customer gateway.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DeleteVPNConnectionRoute.html>
module Network.AWS.EC2.DeleteVPNConnectionRoute
    (
    -- * Request
      DeleteVPNConnectionRoute
    -- ** Request constructor
    , deleteVPNConnectionRoute
    -- ** Request lenses
    , dvcrVPNConnectionId
    , dvcrDestinationCIDRBlock

    -- * Response
    , DeleteVPNConnectionRouteResponse
    -- ** Response constructor
    , deleteVPNConnectionRouteResponse
    ) where

import Network.AWS.EC2.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteVPNConnectionRoute' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvcrVPNConnectionId'
--
-- * 'dvcrDestinationCIDRBlock'
data DeleteVPNConnectionRoute = DeleteVPNConnectionRoute'{_dvcrVPNConnectionId :: Text, _dvcrDestinationCIDRBlock :: Text} deriving (Eq, Read, Show)

-- | 'DeleteVPNConnectionRoute' smart constructor.
deleteVPNConnectionRoute :: Text -> Text -> DeleteVPNConnectionRoute
deleteVPNConnectionRoute pVPNConnectionId pDestinationCIDRBlock = DeleteVPNConnectionRoute'{_dvcrVPNConnectionId = pVPNConnectionId, _dvcrDestinationCIDRBlock = pDestinationCIDRBlock};

-- | The ID of the VPN connection.
dvcrVPNConnectionId :: Lens' DeleteVPNConnectionRoute Text
dvcrVPNConnectionId = lens _dvcrVPNConnectionId (\ s a -> s{_dvcrVPNConnectionId = a});

-- | The CIDR block associated with the local subnet of the customer network.
dvcrDestinationCIDRBlock :: Lens' DeleteVPNConnectionRoute Text
dvcrDestinationCIDRBlock = lens _dvcrDestinationCIDRBlock (\ s a -> s{_dvcrDestinationCIDRBlock = a});

instance AWSPager A where
        page rq rs
          | stop True = Nothing
          | otherwise = Just

instance AWSRequest DeleteVPNConnectionRoute where
        type Sv DeleteVPNConnectionRoute = EC2
        type Rs DeleteVPNConnectionRoute =
             DeleteVPNConnectionRouteResponse
        request = post
        response
          = receiveNull DeleteVPNConnectionRouteResponse'

instance ToHeaders DeleteVPNConnectionRoute where
        toHeaders = const mempty

instance ToPath DeleteVPNConnectionRoute where
        toPath = const "/"

instance ToQuery DeleteVPNConnectionRoute where
        toQuery DeleteVPNConnectionRoute'{..}
          = mconcat
              ["Action" =:
                 ("DeleteVPNConnectionRoute" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "VpnConnectionId" =: _dvcrVPNConnectionId,
               "DestinationCidrBlock" =: _dvcrDestinationCIDRBlock]

-- | /See:/ 'deleteVPNConnectionRouteResponse' smart constructor.
data DeleteVPNConnectionRouteResponse = DeleteVPNConnectionRouteResponse' deriving (Eq, Read, Show)

-- | 'DeleteVPNConnectionRouteResponse' smart constructor.
deleteVPNConnectionRouteResponse :: DeleteVPNConnectionRouteResponse
deleteVPNConnectionRouteResponse = DeleteVPNConnectionRouteResponse';
