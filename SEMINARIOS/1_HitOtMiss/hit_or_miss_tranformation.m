function g = hit_or_miss_tranformation( f, B1, B2 )
    f = logical(f);
    %Eros�es parciais
    P1 = imerode( f, B1 );
    P2 = imerode( not( f ), B2 );
    %Interse��o
    g = min( P1, P2 );
end