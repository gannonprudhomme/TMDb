import Foundation

///
/// Provides an interface for obtaining company data from TMDb.
///
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public final class CompanyService {

    private let apiClient: APIClient

    ///
    /// Creates a company service object.
    ///
    public convenience init() {
        self.init(
            apiClient: TMDbFactory.apiClient
        )
    }

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    ///
    /// Returns a company's details
    ///
    /// [TMDb API - Companies: Details](https://developer.themoviedb.org/reference/company-details)
    ///
    /// - Parameters:
    ///    - id: The identifier of the company.
    ///
    /// - Returns: Matching company.
    ///
    public func details(forCompany id: Company.ID) async throws -> Company {
        try await apiClient.get(endpoint: CompanyEndpoint.details(companyID: id))
    }

}
