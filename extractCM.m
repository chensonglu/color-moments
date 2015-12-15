function CM = extractCM(img, gpc)
% Extract Color Moments (CM) features from a image
% function CM = extractCM(img, gpc)
% Inputs:
%   img   - image in HSI format 
%   gpc   - grid partition constant for CM features extraction
%
% Outputs:
%   CM    - CM features 

% size of image
[h_img, w_img] = size(img(:, :, 1));
% size of each block
block_size = fix(size(img(:, :, 1))/gpc);
h_block = block_size(1);
w_block = block_size(2);
currentBlockIndex = 1;
for i = 1:gpc 
    for j = 1:gpc 
        % pointer to locate CM features in CM vector
        p_cm = gpc*gpc*(currentBlockIndex - 1) + 1; 
        % pointer to locate image blocks
        row = h_block*(i - 1) + 1; 
        col = w_block*(j - 1) + 1; 
        % adjust block size
        if i == gpc
            h_block = h_img - (gpc - 1)*h_block;
        end
        if j == gpc
           w_block = w_img - (gpc - 1)*w_block;
        end
        
        block = img(row:row + h_block - 1, ...
                    col:col + w_block - 1,:); 
        % matrix to vector for each channel
        currentBlock = reshape(block, size(block, 1)*size(block, 2), 3); 
        
        % 3 mean values
        curMean = mean(currentBlock); 
        CM(p_cm:p_cm + 2) = curMean; 
        
        % 3 variances values
        curVar = std(currentBlock); 
        CM(p_cm + 3:p_cm + 5) = curVar;
        
        % 3 skewness values
        curSkew = skewness(currentBlock, 1); 
        CM(p_cm + 6:p_cm + 8)= curSkew;
        
        currentBlockIndex = currentBlockIndex+1;
    end
end
