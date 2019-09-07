import Foundation


extension TimeInterval {
    
    var hour: Int {
        return  NSInteger(self) / 3600
    }
    
    var seconds: Int {
        return  NSInteger(self) % 60
    }
    
    var minutes: Int {
        return  (NSInteger(self) / 60) % 60
    }
}
