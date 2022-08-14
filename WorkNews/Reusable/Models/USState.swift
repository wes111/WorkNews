//
//  USState.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import Foundation
import CoreText

// US states and territories.
enum USState: String, CaseIterable {
    case AL
    case AK
    case AZ
    case AR
    case CA
    case CO
    case CT
    case DE
    case DC
    case FL
    case GA
    case GU
    case HI
    case ID
    case IL
    case IN
    case IA
    case KS
    case KY
    case LA
    case ME
    case MD
    case MA
    case MI
    case MN
    case MS
    case MO
    case MT
    case NE
    case NV
    case NH
    case NJ
    case NM
    case NY
    case NC
    case ND
    case OH
    case OK
    case OR
    case PA
    case RI
    case SC
    case SD
    case TN
    case TX
    case UT
    case VT
    case VA
    case WA
    case WV
    case WI
    case WY
    
    var name: String {
        switch self {
            
        case .AL: return "Alabama"
        case .AK: return "Alaska"
        case .AZ: return "Arizona"
        case .AR: return "Arkansas"
        case .CA: return "California"
        case .CO: return "Colorado"
        case .CT: return "Connecticut"
        case .DE: return "Delaware"
        case .DC: return "District of Columbia"
        case .FL: return "Florida"
        case .GA: return "Georgia"
        case .GU: return "Guam"
        case .HI: return "Hawaii"
        case .ID: return "Idaho"
        case .IL: return "Illinois"
        case .IN: return "Indiana"
        case .IA: return "Iowa"
        case .KS: return "Kansas"
        case .KY: return "Kentucky"
        case .LA: return "Louisiana"
        case .ME: return "Maine"
        case .MD: return "Maryland"
        case .MA: return "Massachusetts"
        case .MI: return "Michigan"
        case .MN: return "Minnesota"
        case .MS: return "Mississippi"
        case .MO: return "Missouri"
        case .MT: return "Montana"
        case .NE: return "Nebraska"
        case .NV: return "Nevada"
        case .NH: return "New Hampshire"
        case .NJ: return "New Jersey"
        case .NM: return "New Mexico"
        case .NY: return "New York"
        case .NC: return "North Carolina"
        case .ND: return "North Dakota"
        case .OH: return "Ohio"
        case .OK: return "Oklahoma"
        case .OR: return "Oregon"
        case .PA: return "Pennsylvania"
        case .RI: return "Rhode Island"
        case .SC: return "South Carolina"
        case .SD: return "South Dakota"
        case .TN: return "Tennessee"
        case .TX: return "Texas"
        case .UT: return "Utah"
        case .VT: return "Vermont"
        case .VA: return "Virginia"
        case .WA: return "Washington"
        case .WV: return "West Virginia"
        case .WI: return "Wisconsin"
        case .WY: return "Wyoming"
        }
    }
}
