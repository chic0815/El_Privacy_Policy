//
//  PrivacyPolicy.swift
//  
//
//  Created by Jaesung on 2019/12/23.
//

import Foundation

public class PrivacyPolicy {
    public let serviceName: String
    public let companyName: String
    public let email: String
    public let website: String
    public let date: String
    public let country: String
    
    /**
     # Large Titles likes "#"
     */
    public var largeTitles: [String] = []
    
    
    /**
     ## SubTitles likes "##"
     */
    public var subTitles: [String] = []
    
    /**
     ### headings likes "###"
     */
    public var headings: [String] = []
    
    public var bodies: [String] = []
    
    weak var delegate: PrivacyPolicyDelegate!
    /**
     You have to fill out all parameters.  You can assign an empty `String` to email or website, but not both,
     */
    public init(service: String, company: String, email: String, website: String, country: Country) {
        self.serviceName = service
        self.companyName = company
        self.email = email
        self.website = website
        let date = Date()
        self.date = date.convertToString()
        self.country = country.rawValue
    }
    
    public func createIntroduction() {
        self.largeTitles.append("Privacy Policy")
        
        let body = """
        Effective date: \(self.date)
        \(self.companyName) ("us", "we", or "our") operates \(serviceName) (the "Service").
        This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data. Our Privacy Policy for \(serviceName) is created with the help of the ElPrivacyPolicy Swift Package.
        We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.
        """
        self.bodies.append(body)
    }
    
    public func infoCollectionUsage() {
        if !self.delegate.collectsUserInformation() { return }
        self.largeTitles.append("Information Collection And Use")
        
        self.subTitles.append("Types of Data Collected")
        
        self.personalData()
        self.usageData()
        self.trackingCookies()
    }
    
    private func personalData() {
        self.headings.append("Personal Data")
        
        let body = """
        While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:
        Email addressCookies and Usage Data
        """
        self.bodies.append(body)
    }
    
    private func usageData() {
        self.headings.append("Usage Data")
        
        let body = """
        When you access the Service by or through a mobile device, we may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data ("Usage Data").
        """
        self.bodies.append(body)
    }
    
    private func trackingCookies() {
        if !self.delegate.tracksAndCollectsCookieData() { return }
        self.headings.append("Tracking & Cookies Data")
        
        let body = """
        We use cookies and similar tracking technologies to track the activity on our Service and hold certain information.
        Cookies are files with small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our Service.
        You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.
        
        Examples of Cookies we use:
        Session Cookies. We use Session Cookies to operate our Service.Preference Cookies. We use Preference Cookies to remember your preferences and various settings.Security Cookies. We use Security Cookies for security purposes.
        """
        self.bodies.append(body)
    }
    
    public func useOfData() {
        self.largeTitles.append("Use of Data")
        
        let body = """
        \(companyName) uses the collected data for various purposes:
        To provide and maintain the Service
        To notify you about changes to our Service
        To allow you to participate in interactive features of our Service when you choose to do so
        To provide customer care and supportTo provide analysis or valuable information so that we can improve the Service
        To monitor the usage of the ServiceTo detect, prevent and address technical issues
        """
        self.bodies.append(body)
    }
    
    public func transferOfData() {
        self.largeTitles.append("Transfer of Data")
        
        let body = """
        Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction.
        If you are located outside \(self.country) and choose to provide information to us, please note that we transfer the data, including Personal Data, to \(self.country) and process it there.
        Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.
        \(self.companyName) will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.
        """
        self.bodies.append(body)
    }
    
    
    public func disclosureOfData() {
        self.largeTitles.append("")
        
        self.legalRequirements()
    }
    
    func legalRequirements() {
        self.subTitles.append("Legal Requirements")
        
        let body = """
        \(self.companyName) may disclose your Personal Data in the good faith belief that such action is necessary to:
        To comply with a legal obligation
        To protect and defend the rights or property of \(self.companyName)
        To prevent or investigate possible wrong doing in connection with the Service
        To protect the personal safety of users of the Service or the public
        To protect against legal liability
        """
        self.bodies.append(body)
    }
    
    public func securityOfData() {
        if !self.delegate.isDataSafe() { return }
        self.largeTitles.append("Security of Data")
        
        let body = """
        The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.
        """
        self.bodies.append(body)
    }
    
    public func serviceProviders() {
        self.largeTitles.append("Service Providers")
        
        let body = """
        We may employ third party companies and individuals to facilitate our Service ("Service Providers"), to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used.
        These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.
        """
        self.bodies.append(body)
    }
    
    public func linksToOtherSites() {
        if !self.delegate.linksToOtherSites() { return }
        self.largeTitles.append("Links To Other Sites")
        
        let body = """
        Our Service may contain links to other sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit.
        We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.
        """
        self.bodies.append(body)
    }
    
    public func childrensPrivacy() {
        if !self.delegate.servicesToChildren() { return }
        self.largeTitles.append("Children's Policy")
        
        let body = """
        Our Service does not address anyone under the age of 18 ("Children").
        We do not knowingly collect personally identifiable information from anyone under the age of 18. If you are a parent or guardian and you are aware that your Children has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from children without verification of parental consent, we take steps to remove that information from our servers.
        """
        self.bodies.append(body)
    }
    
    public func changesToThisPrivacyPolicy() {
        self.largeTitles.append("Changes To This Privacy Policy")
        
        let body = """
        We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.
        We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update the "effective date" at the top of this Privacy Policy.
        You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.
        """
        self.bodies.append(body)
    }
    
    public func contactUs() {
        if self.email.isEmpty, self.website.isEmpty {
            print("Failed to generate contact information. This method requires either an email or a website link.")
        }
        self.largeTitles.append("Contact Us")
        
        var contactDetail = ""
        if !self.email.isEmpty {
            let emailString = "By email: \(self.email)\n"
            contactDetail = contactDetail + emailString
        } else if !self.website.isEmpty {
            let webString = "By visiting this page on our website: \(self.website)\n"
            contactDetail = contactDetail + webString
        }
        
        let body = """
        If you have any questions about this Privacy Policy, please contact us:
        \(contactDetail)
        """
        self.bodies.append(body)
    }
}

extension Date {
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: self)
    }
}
