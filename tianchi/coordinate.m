classdef coordinate
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        site_id
        lng
        lat
    end
    
    methods
      function d = coordinate(site_id, lng, lat)
        d.site_id = site_id
        d.lng = lng
        d.lat = lat
      end
    end
    
    methods
      function d = setCoordinate(lng, lat)
        d.lng = lng
        d.lat = lat
      end
    end
    
    methods
      function d = distance(a)
        d = a
      end
    end
    
end

