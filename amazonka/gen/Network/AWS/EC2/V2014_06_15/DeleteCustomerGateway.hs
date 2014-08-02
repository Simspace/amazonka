{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.EC2.V2014_06_15.DeleteCustomerGateway
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified customer gateway. You must delete the VPN connection
-- before you can delete the customer gateway. Example This example deletes
-- the specified customer gateway.
-- https://ec2.amazonaws.com/?Action=DeleteCustomerGateway
-- &amp;CustomerGatewayId=cgw-b4dc3961 &amp;AUTHPARAMS
-- &lt;DeleteCustomerGatewayResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;7a62c49f-347e-4fc4-9331-6e8eEXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/DeleteCustomerGatewayResponse&gt;.
module Network.AWS.EC2.V2014_06_15.DeleteCustomerGateway where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DeleteCustomerGateway' request.
deleteCustomerGateway :: Text -- ^ '_dcgtCustomerGatewayId'
                      -> DeleteCustomerGateway
deleteCustomerGateway p1 = DeleteCustomerGateway
    { _dcgtCustomerGatewayId = p1
    , _dcgtDryRun = Nothing
    }

data DeleteCustomerGateway = DeleteCustomerGateway
    { _dcgtCustomerGatewayId :: Text
      -- ^ The ID of the customer gateway.
    , _dcgtDryRun :: Maybe Bool
      -- ^ 
    } deriving (Generic)

makeLenses ''DeleteCustomerGateway

instance ToQuery DeleteCustomerGateway where
    toQuery = genericToQuery def

data DeleteCustomerGatewayResponse = DeleteCustomerGatewayResponse
    deriving (Eq, Show, Generic)

makeLenses ''DeleteCustomerGatewayResponse

instance AWSRequest DeleteCustomerGateway where
    type Sv DeleteCustomerGateway = EC2
    type Rs DeleteCustomerGateway = DeleteCustomerGatewayResponse

    request = post "DeleteCustomerGateway"
    response _ _ = return (Right DeleteCustomerGatewayResponse)
