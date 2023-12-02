% down sampling and normalize the data
% ------------------------------------------------------------------------------
% MIT License
% 
% Copyright (c) 2023 Dr. Longhao Qian
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ------------------------------------------------------------------------------
function idxArray = GetDownSampledIdx(samplePeriod, arr, startIdx, endIdx)
    baseIdx = startIdx;
    totalLen = length(arr);
    idxArray = [];
    while (baseIdx <= totalLen) && (baseIdx < endIdx)
        % increase the localIdx, untial arr[localIdx] > samplePeriod + arr[baseIdx]
        localIdx = 1 + baseIdx;
        while (localIdx <= totalLen) && (arr(localIdx) < (samplePeriod + arr(baseIdx)))
            localIdx = localIdx + 1;
        end
        idxArray = [idxArray, localIdx];
        baseIdx = localIdx;
    end
end