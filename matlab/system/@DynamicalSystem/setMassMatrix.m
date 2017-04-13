function obj = setMassMatrix(obj, M)
    % Set the mass matrix M(x) of the system
    %
    % Parameters:
    %  M:  the mass matrix M(x) @type SymFunction
    
    
    % validate and set the mass matrix M(x)
    if ~isempty(M)
        
        [nr,nc] = size(M);
        assert(nr==obj.numState && nc==obj.numState,...
            'The size of the mass matrix should be (%d x %d).',obj.numState,obj.numState);
        if isa(M,'SymFunction')
            obj.Mmat = M;
        else
            M = SymExpression(M);
            obj.Mmat = SymFunction(['Mmat_',obj.Name],M,obj.States.x);
        end
    end
    
    
end