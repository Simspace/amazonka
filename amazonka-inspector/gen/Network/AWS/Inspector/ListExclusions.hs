{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Inspector.ListExclusions
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- List exclusions that are generated by the assessment run.
--
--
--
-- This operation returns paginated results.
module Network.AWS.Inspector.ListExclusions
    (
    -- * Creating a Request
      listExclusions
    , ListExclusions
    -- * Request Lenses
    , leNextToken
    , leMaxResults
    , leAssessmentRunARN

    -- * Destructuring the Response
    , listExclusionsResponse
    , ListExclusionsResponse
    -- * Response Lenses
    , lersNextToken
    , lersResponseStatus
    , lersExclusionARNs
    ) where

import Network.AWS.Inspector.Types
import Network.AWS.Inspector.Types.Product
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listExclusions' smart constructor.
data ListExclusions = ListExclusions'
  { _leNextToken        :: !(Maybe Text)
  , _leMaxResults       :: !(Maybe Int)
  , _leAssessmentRunARN :: !Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ListExclusions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'leNextToken' - You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListExclusionsRequest action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data.
--
-- * 'leMaxResults' - You can use this parameter to indicate the maximum number of items you want in the response. The default value is 100. The maximum value is 500.
--
-- * 'leAssessmentRunARN' - The ARN of the assessment run that generated the exclusions that you want to list.
listExclusions
    :: Text -- ^ 'leAssessmentRunARN'
    -> ListExclusions
listExclusions pAssessmentRunARN_ =
  ListExclusions'
    { _leNextToken = Nothing
    , _leMaxResults = Nothing
    , _leAssessmentRunARN = pAssessmentRunARN_
    }


-- | You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListExclusionsRequest action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data.
leNextToken :: Lens' ListExclusions (Maybe Text)
leNextToken = lens _leNextToken (\ s a -> s{_leNextToken = a})

-- | You can use this parameter to indicate the maximum number of items you want in the response. The default value is 100. The maximum value is 500.
leMaxResults :: Lens' ListExclusions (Maybe Int)
leMaxResults = lens _leMaxResults (\ s a -> s{_leMaxResults = a})

-- | The ARN of the assessment run that generated the exclusions that you want to list.
leAssessmentRunARN :: Lens' ListExclusions Text
leAssessmentRunARN = lens _leAssessmentRunARN (\ s a -> s{_leAssessmentRunARN = a})

instance AWSPager ListExclusions where
        page rq rs
          | stop (rs ^. lersNextToken) = Nothing
          | stop (rs ^. lersExclusionARNs) = Nothing
          | otherwise =
            Just $ rq & leNextToken .~ rs ^. lersNextToken

instance AWSRequest ListExclusions where
        type Rs ListExclusions = ListExclusionsResponse
        request = postJSON inspector
        response
          = receiveJSON
              (\ s h x ->
                 ListExclusionsResponse' <$>
                   (x .?> "nextToken") <*> (pure (fromEnum s)) <*>
                     (x .?> "exclusionArns" .!@ mempty))

instance Hashable ListExclusions where

instance NFData ListExclusions where

instance ToHeaders ListExclusions where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("InspectorService.ListExclusions" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListExclusions where
        toJSON ListExclusions'{..}
          = object
              (catMaybes
                 [("nextToken" .=) <$> _leNextToken,
                  ("maxResults" .=) <$> _leMaxResults,
                  Just ("assessmentRunArn" .= _leAssessmentRunARN)])

instance ToPath ListExclusions where
        toPath = const "/"

instance ToQuery ListExclusions where
        toQuery = const mempty

-- | /See:/ 'listExclusionsResponse' smart constructor.
data ListExclusionsResponse = ListExclusionsResponse'
  { _lersNextToken      :: !(Maybe Text)
  , _lersResponseStatus :: !Int
  , _lersExclusionARNs  :: ![Text]
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ListExclusionsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lersNextToken' - When a response is generated, if there is more data to be listed, this parameters is present in the response and contains the value to use for the nextToken parameter in a subsequent pagination request. If there is no more data to be listed, this parameter is set to null.
--
-- * 'lersResponseStatus' - -- | The response status code.
--
-- * 'lersExclusionARNs' - A list of exclusions' ARNs returned by the action.
listExclusionsResponse
    :: Int -- ^ 'lersResponseStatus'
    -> ListExclusionsResponse
listExclusionsResponse pResponseStatus_ =
  ListExclusionsResponse'
    { _lersNextToken = Nothing
    , _lersResponseStatus = pResponseStatus_
    , _lersExclusionARNs = mempty
    }


-- | When a response is generated, if there is more data to be listed, this parameters is present in the response and contains the value to use for the nextToken parameter in a subsequent pagination request. If there is no more data to be listed, this parameter is set to null.
lersNextToken :: Lens' ListExclusionsResponse (Maybe Text)
lersNextToken = lens _lersNextToken (\ s a -> s{_lersNextToken = a})

-- | -- | The response status code.
lersResponseStatus :: Lens' ListExclusionsResponse Int
lersResponseStatus = lens _lersResponseStatus (\ s a -> s{_lersResponseStatus = a})

-- | A list of exclusions' ARNs returned by the action.
lersExclusionARNs :: Lens' ListExclusionsResponse [Text]
lersExclusionARNs = lens _lersExclusionARNs (\ s a -> s{_lersExclusionARNs = a}) . _Coerce

instance NFData ListExclusionsResponse where