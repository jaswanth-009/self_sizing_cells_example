//
//  People.swift
//  self_sizing_cells
//
//  Created by Kunjeti Jassvanthh on 08/09/21.
//

import Foundation

struct People : Decodable
{
    var people: [Bio]

static func function_to_get_data() -> [Bio]
{
    var results = [Bio]()
    if let filepath = Bundle.main.path(forResource: "info", ofType: "json")
    {
        do
        {
            let contents = try Data(contentsOf: URL(fileURLWithPath: filepath)) // load json contents
            let data = try JSONDecoder().decode(People.self, from: contents)    // parse contents
            results = data.people
        }
        catch
        {
            print("Contents could not be loaded/parsed")
        }
   }
   else
    {
        print("File not found")
    }
    return results
}

}
