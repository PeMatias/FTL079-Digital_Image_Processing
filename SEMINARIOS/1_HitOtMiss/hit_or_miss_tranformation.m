function g = hit_or_miss_tranformation( f, B1, B2 )
    f = logical(f);
    %Erosões parciais
    P1 = imerode( f, B1 );
    P2 = imerode( not( f ), B2 );
    %Interseção
    g = min( P1, P2 );
end