import Foundation

final class NetworkService {

	private let session = URLSession.shared
	
	func task(completion: @escaping ([Town]) -> Void) {
		guard let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords") 
			else {
                return
            }
            session.dataTask(with: url) { (data, _, networkError) in
			
                guard let data = data else {
                    return
                }
                do {
                    let towns = try JSONDecoder().decode([Town].self , from: data)
                    completion(towns)
                } catch {
                    print (error)
                }
        }.resume()
    }
}
