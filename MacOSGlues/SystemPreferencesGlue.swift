//
//  SystemPreferencesGlue.swift
//  System Preferences.app 14.0
//  SwiftAutomation.framework 0.1.0
//  `aeglue -S 'System Preferences.app'`
//


import Foundation
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(applicationClassName: "SystemPreferences",
                                                     classNamePrefix: "SPR",
                                                     typeNames: [
                                                                     0x616c6973: "alias", // "alis"
                                                                     0x78707061: "anchor", // "xppa"
                                                                     0x2a2a2a2a: "anything", // "****"
                                                                     0x62756e64: "applicationBundleId", // "bund"
                                                                     0x7369676e: "applicationSignature", // "sign"
                                                                     0x6170726c: "applicationUrl", // "aprl"
                                                                     0x61707220: "April", // "apr\0x20"
                                                                     0x61736b20: "ask", // "ask\0x20"
                                                                     0x61756720: "August", // "aug\0x20"
                                                                     0x62657374: "best", // "best"
                                                                     0x626f6f6c: "boolean", // "bool"
                                                                     0x71647274: "boundingRectangle", // "qdrt"
                                                                     0x63617365: "case_", // "case"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x636c7274: "colorTable", // "clrt"
                                                                     0x78706370: "currentPane", // "xpcp"
                                                                     0x74646173: "dashStyle", // "tdas"
                                                                     0x74647461: "data", // "tdta"
                                                                     0x6c647420: "date", // "ldt\0x20"
                                                                     0x64656320: "December", // "dec\0x20"
                                                                     0x6465636d: "decimalStruct", // "decm"
                                                                     0x64696163: "diacriticals", // "diac"
                                                                     0x636f6d70: "doubleInteger", // "comp"
                                                                     0x656e6373: "encodedString", // "encs"
                                                                     0x656e756d: "enumerator", // "enum"
                                                                     0x45505320: "EPSPicture", // "EPS\0x20"
                                                                     0x65787061: "expansion", // "expa"
                                                                     0x65787465: "extendedFloat", // "exte"
                                                                     0x66656220: "February", // "feb\0x20"
                                                                     0x66737266: "fileRef", // "fsrf"
                                                                     0x66737320: "fileSpecification", // "fss\0x20"
                                                                     0x6675726c: "fileUrl", // "furl"
                                                                     0x66697864: "fixed", // "fixd"
                                                                     0x66706e74: "fixedPoint", // "fpnt"
                                                                     0x66726374: "fixedRectangle", // "frct"
                                                                     0x646f7562: "float", // "doub"
                                                                     0x6c64626c: "float128bit", // "ldbl"
                                                                     0x66726920: "Friday", // "fri\0x20"
                                                                     0x47494666: "GIFPicture", // "GIFf"
                                                                     0x63677478: "graphicText", // "cgtx"
                                                                     0x68797068: "hyphens", // "hyph"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x6c6f6e67: "integer", // "long"
                                                                     0x69747874: "internationalText", // "itxt"
                                                                     0x696e746c: "internationalWritingCode", // "intl"
                                                                     0x636f626a: "item", // "cobj"
                                                                     0x6a616e20: "January", // "jan\0x20"
                                                                     0x4a504547: "JPEGPicture", // "JPEG"
                                                                     0x6a756c20: "July", // "jul\0x20"
                                                                     0x6a756e20: "June", // "jun\0x20"
                                                                     0x6b706964: "kernelProcessId", // "kpid"
                                                                     0x6c697374: "list", // "list"
                                                                     0x7870736e: "localizedName", // "xpsn"
                                                                     0x696e736c: "locationReference", // "insl"
                                                                     0x6c667864: "longFixed", // "lfxd"
                                                                     0x6c667074: "longFixedPoint", // "lfpt"
                                                                     0x6c667263: "longFixedRectangle", // "lfrc"
                                                                     0x6c706e74: "longPoint", // "lpnt"
                                                                     0x6c726374: "longRectangle", // "lrct"
                                                                     0x6d616368: "machine", // "mach"
                                                                     0x6d4c6f63: "machineLocation", // "mLoc"
                                                                     0x706f7274: "machPort", // "port"
                                                                     0x6d617220: "March", // "mar\0x20"
                                                                     0x6d617920: "May", // "may\0x20"
                                                                     0x6d6f6e20: "Monday", // "mon\0x20"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e6f2020: "no", // "no\0x20\0x20"
                                                                     0x6e6f7620: "November", // "nov\0x20"
                                                                     0x6e756c6c: "null", // "null"
                                                                     0x6e756d65: "numericStrings", // "nume"
                                                                     0x6f637420: "October", // "oct\0x20"
                                                                     0x78707062: "pane", // "xppb"
                                                                     0x50494354: "PICTPicture", // "PICT"
                                                                     0x74706d6d: "pixelMapRecord", // "tpmm"
                                                                     0x51447074: "point", // "QDpt"
                                                                     0x78707077: "preferencesWindow", // "xppw"
                                                                     0x70736e20: "processSerialNumber", // "psn\0x20"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x70726f70: "property_", // "prop"
                                                                     0x70756e63: "punctuation", // "punc"
                                                                     0x7265636f: "record", // "reco"
                                                                     0x6f626a20: "reference", // "obj\0x20"
                                                                     0x74723136: "RGB16Color", // "tr16"
                                                                     0x74723936: "RGB96Color", // "tr96"
                                                                     0x63524742: "RGBColor", // "cRGB"
                                                                     0x74726f74: "rotation", // "trot"
                                                                     0x73617420: "Saturday", // "sat\0x20"
                                                                     0x73637074: "script", // "scpt"
                                                                     0x73657020: "September", // "sep\0x20"
                                                                     0x73696e67: "shortFloat", // "sing"
                                                                     0x73686f72: "shortInteger", // "shor"
                                                                     0x78707361: "showAll", // "xpsa"
                                                                     0x54455854: "string", // "TEXT"
                                                                     0x7374796c: "styledClipboardText", // "styl"
                                                                     0x53545854: "styledText", // "STXT"
                                                                     0x73756e20: "Sunday", // "sun\0x20"
                                                                     0x74737479: "textStyleInfo", // "tsty"
                                                                     0x74687520: "Thursday", // "thu\0x20"
                                                                     0x54494646: "TIFFPicture", // "TIFF"
                                                                     0x74756520: "Tuesday", // "tue\0x20"
                                                                     0x74797065: "typeClass", // "type"
                                                                     0x75747874: "unicodeText", // "utxt"
                                                                     0x6d61676e: "unsignedInteger", // "magn"
                                                                     0x75743136: "utf16Text", // "ut16"
                                                                     0x75746638: "utf8Text", // "utf8"
                                                                     0x76657273: "version", // "vers"
                                                                     0x77656420: "Wednesday", // "wed\0x20"
                                                                     0x77686974: "whitespace", // "whit"
                                                                     0x70736374: "writingCode", // "psct"
                                                                     0x79657320: "yes", // "yes\0x20"
                                                     ],
                                                     propertyNames: [
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x78706370: "currentPane", // "xpcp"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x7870736e: "localizedName", // "xpsn"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x78707077: "preferencesWindow", // "xppw"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x78707361: "showAll", // "xpsa"
                                                     ],
                                                     elementsNames: [
                                                                     0x78707061: "anchors", // "xppa"
                                                                     0x636f626a: "items", // "cobj"
                                                                     0x78707062: "panes", // "xppb"
                                                     ])

private let _glueClasses = SwiftAutomation.GlueClasses(insertionSpecifierType: SPRInsertion.self,
                                       objectSpecifierType: SPRItem.self,
                                       multiObjectSpecifierType: SPRItems.self,
                                       rootSpecifierType: SPRRoot.self,
                                       applicationType: SystemPreferences.self,
                                       symbolType: SPRSymbol.self,
                                       formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on System Preferences.app terminology

public class SPRSymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "SPR"}

    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> SPRSymbol {
        switch (code) {
        case 0x616c6973: return self.alias // "alis"
        case 0x78707061: return self.anchor // "xppa"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x62756e64: return self.applicationBundleId // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationUrl // "aprl"
        case 0x61707220: return self.April // "apr\0x20"
        case 0x61736b20: return self.ask // "ask\0x20"
        case 0x61756720: return self.August // "aug\0x20"
        case 0x62657374: return self.best // "best"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x63617365: return self.case_ // "case"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x78706370: return self.currentPane // "xpcp"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x6c647420: return self.date // "ldt\0x20"
        case 0x64656320: return self.December // "dec\0x20"
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x656e756d: return self.enumerator // "enum"
        case 0x45505320: return self.EPSPicture // "EPS\0x20"
        case 0x65787061: return self.expansion // "expa"
        case 0x65787465: return self.extendedFloat // "exte"
        case 0x66656220: return self.February // "feb\0x20"
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x66737320: return self.fileSpecification // "fss\0x20"
        case 0x6675726c: return self.fileUrl // "furl"
        case 0x66697864: return self.fixed // "fixd"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x646f7562: return self.float // "doub"
        case 0x6c64626c: return self.float128bit // "ldbl"
        case 0x66726920: return self.Friday // "fri\0x20"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID\0x20\0x20"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x6a616e20: return self.January // "jan\0x20"
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul\0x20"
        case 0x6a756e20: return self.June // "jun\0x20"
        case 0x6b706964: return self.kernelProcessId // "kpid"
        case 0x6c697374: return self.list // "list"
        case 0x7870736e: return self.localizedName // "xpsn"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar\0x20"
        case 0x6d617920: return self.May // "may\0x20"
        case 0x6d6f6e20: return self.Monday // "mon\0x20"
        case 0x706e616d: return self.name // "pnam"
        case 0x6e6f2020: return self.no // "no\0x20\0x20"
        case 0x6e6f7620: return self.November // "nov\0x20"
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct\0x20"
        case 0x78707062: return self.pane // "xppb"
        case 0x50494354: return self.PICTPicture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x51447074: return self.point // "QDpt"
        case 0x78707077: return self.preferencesWindow // "xppw"
        case 0x70736e20: return self.processSerialNumber // "psn\0x20"
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x7265636f: return self.record // "reco"
        case 0x6f626a20: return self.reference // "obj\0x20"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x73617420: return self.Saturday // "sat\0x20"
        case 0x73637074: return self.script // "scpt"
        case 0x73657020: return self.September // "sep\0x20"
        case 0x73696e67: return self.shortFloat // "sing"
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x78707361: return self.showAll // "xpsa"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x73756e20: return self.Sunday // "sun\0x20"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu\0x20"
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x74756520: return self.Tuesday // "tue\0x20"
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.unicodeText // "utxt"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75743136: return self.utf16Text // "ut16"
        case 0x75746638: return self.utf8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x77656420: return self.Wednesday // "wed\0x20"
        case 0x77686974: return self.whitespace // "whit"
        case 0x70736374: return self.writingCode // "psct"
        case 0x79657320: return self.yes // "yes\0x20"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! SPRSymbol
        }
    }

    // Types/properties
    public static let alias = SPRSymbol(name: "alias", code: 0x616c6973, type: typeType) // "alis"
    public static let anchor = SPRSymbol(name: "anchor", code: 0x78707061, type: typeType) // "xppa"
    public static let anything = SPRSymbol(name: "anything", code: 0x2a2a2a2a, type: typeType) // "****"
    public static let applicationBundleId = SPRSymbol(name: "applicationBundleId", code: 0x62756e64, type: typeType) // "bund"
    public static let applicationSignature = SPRSymbol(name: "applicationSignature", code: 0x7369676e, type: typeType) // "sign"
    public static let applicationUrl = SPRSymbol(name: "applicationUrl", code: 0x6170726c, type: typeType) // "aprl"
    public static let April = SPRSymbol(name: "April", code: 0x61707220, type: typeType) // "apr\0x20"
    public static let August = SPRSymbol(name: "August", code: 0x61756720, type: typeType) // "aug\0x20"
    public static let best = SPRSymbol(name: "best", code: 0x62657374, type: typeType) // "best"
    public static let boolean = SPRSymbol(name: "boolean", code: 0x626f6f6c, type: typeType) // "bool"
    public static let boundingRectangle = SPRSymbol(name: "boundingRectangle", code: 0x71647274, type: typeType) // "qdrt"
    public static let class_ = SPRSymbol(name: "class_", code: 0x70636c73, type: typeType) // "pcls"
    public static let colorTable = SPRSymbol(name: "colorTable", code: 0x636c7274, type: typeType) // "clrt"
    public static let currentPane = SPRSymbol(name: "currentPane", code: 0x78706370, type: typeType) // "xpcp"
    public static let dashStyle = SPRSymbol(name: "dashStyle", code: 0x74646173, type: typeType) // "tdas"
    public static let data = SPRSymbol(name: "data", code: 0x74647461, type: typeType) // "tdta"
    public static let date = SPRSymbol(name: "date", code: 0x6c647420, type: typeType) // "ldt\0x20"
    public static let December = SPRSymbol(name: "December", code: 0x64656320, type: typeType) // "dec\0x20"
    public static let decimalStruct = SPRSymbol(name: "decimalStruct", code: 0x6465636d, type: typeType) // "decm"
    public static let doubleInteger = SPRSymbol(name: "doubleInteger", code: 0x636f6d70, type: typeType) // "comp"
    public static let encodedString = SPRSymbol(name: "encodedString", code: 0x656e6373, type: typeType) // "encs"
    public static let enumerator = SPRSymbol(name: "enumerator", code: 0x656e756d, type: typeType) // "enum"
    public static let EPSPicture = SPRSymbol(name: "EPSPicture", code: 0x45505320, type: typeType) // "EPS\0x20"
    public static let extendedFloat = SPRSymbol(name: "extendedFloat", code: 0x65787465, type: typeType) // "exte"
    public static let February = SPRSymbol(name: "February", code: 0x66656220, type: typeType) // "feb\0x20"
    public static let fileRef = SPRSymbol(name: "fileRef", code: 0x66737266, type: typeType) // "fsrf"
    public static let fileSpecification = SPRSymbol(name: "fileSpecification", code: 0x66737320, type: typeType) // "fss\0x20"
    public static let fileUrl = SPRSymbol(name: "fileUrl", code: 0x6675726c, type: typeType) // "furl"
    public static let fixed = SPRSymbol(name: "fixed", code: 0x66697864, type: typeType) // "fixd"
    public static let fixedPoint = SPRSymbol(name: "fixedPoint", code: 0x66706e74, type: typeType) // "fpnt"
    public static let fixedRectangle = SPRSymbol(name: "fixedRectangle", code: 0x66726374, type: typeType) // "frct"
    public static let float = SPRSymbol(name: "float", code: 0x646f7562, type: typeType) // "doub"
    public static let float128bit = SPRSymbol(name: "float128bit", code: 0x6c64626c, type: typeType) // "ldbl"
    public static let Friday = SPRSymbol(name: "Friday", code: 0x66726920, type: typeType) // "fri\0x20"
    public static let GIFPicture = SPRSymbol(name: "GIFPicture", code: 0x47494666, type: typeType) // "GIFf"
    public static let graphicText = SPRSymbol(name: "graphicText", code: 0x63677478, type: typeType) // "cgtx"
    public static let id = SPRSymbol(name: "id", code: 0x49442020, type: typeType) // "ID\0x20\0x20"
    public static let integer = SPRSymbol(name: "integer", code: 0x6c6f6e67, type: typeType) // "long"
    public static let internationalText = SPRSymbol(name: "internationalText", code: 0x69747874, type: typeType) // "itxt"
    public static let internationalWritingCode = SPRSymbol(name: "internationalWritingCode", code: 0x696e746c, type: typeType) // "intl"
    public static let item = SPRSymbol(name: "item", code: 0x636f626a, type: typeType) // "cobj"
    public static let January = SPRSymbol(name: "January", code: 0x6a616e20, type: typeType) // "jan\0x20"
    public static let JPEGPicture = SPRSymbol(name: "JPEGPicture", code: 0x4a504547, type: typeType) // "JPEG"
    public static let July = SPRSymbol(name: "July", code: 0x6a756c20, type: typeType) // "jul\0x20"
    public static let June = SPRSymbol(name: "June", code: 0x6a756e20, type: typeType) // "jun\0x20"
    public static let kernelProcessId = SPRSymbol(name: "kernelProcessId", code: 0x6b706964, type: typeType) // "kpid"
    public static let list = SPRSymbol(name: "list", code: 0x6c697374, type: typeType) // "list"
    public static let localizedName = SPRSymbol(name: "localizedName", code: 0x7870736e, type: typeType) // "xpsn"
    public static let locationReference = SPRSymbol(name: "locationReference", code: 0x696e736c, type: typeType) // "insl"
    public static let longFixed = SPRSymbol(name: "longFixed", code: 0x6c667864, type: typeType) // "lfxd"
    public static let longFixedPoint = SPRSymbol(name: "longFixedPoint", code: 0x6c667074, type: typeType) // "lfpt"
    public static let longFixedRectangle = SPRSymbol(name: "longFixedRectangle", code: 0x6c667263, type: typeType) // "lfrc"
    public static let longPoint = SPRSymbol(name: "longPoint", code: 0x6c706e74, type: typeType) // "lpnt"
    public static let longRectangle = SPRSymbol(name: "longRectangle", code: 0x6c726374, type: typeType) // "lrct"
    public static let machine = SPRSymbol(name: "machine", code: 0x6d616368, type: typeType) // "mach"
    public static let machineLocation = SPRSymbol(name: "machineLocation", code: 0x6d4c6f63, type: typeType) // "mLoc"
    public static let machPort = SPRSymbol(name: "machPort", code: 0x706f7274, type: typeType) // "port"
    public static let March = SPRSymbol(name: "March", code: 0x6d617220, type: typeType) // "mar\0x20"
    public static let May = SPRSymbol(name: "May", code: 0x6d617920, type: typeType) // "may\0x20"
    public static let Monday = SPRSymbol(name: "Monday", code: 0x6d6f6e20, type: typeType) // "mon\0x20"
    public static let name = SPRSymbol(name: "name", code: 0x706e616d, type: typeType) // "pnam"
    public static let November = SPRSymbol(name: "November", code: 0x6e6f7620, type: typeType) // "nov\0x20"
    public static let null = SPRSymbol(name: "null", code: 0x6e756c6c, type: typeType) // "null"
    public static let October = SPRSymbol(name: "October", code: 0x6f637420, type: typeType) // "oct\0x20"
    public static let pane = SPRSymbol(name: "pane", code: 0x78707062, type: typeType) // "xppb"
    public static let PICTPicture = SPRSymbol(name: "PICTPicture", code: 0x50494354, type: typeType) // "PICT"
    public static let pixelMapRecord = SPRSymbol(name: "pixelMapRecord", code: 0x74706d6d, type: typeType) // "tpmm"
    public static let point = SPRSymbol(name: "point", code: 0x51447074, type: typeType) // "QDpt"
    public static let preferencesWindow = SPRSymbol(name: "preferencesWindow", code: 0x78707077, type: typeType) // "xppw"
    public static let processSerialNumber = SPRSymbol(name: "processSerialNumber", code: 0x70736e20, type: typeType) // "psn\0x20"
    public static let properties = SPRSymbol(name: "properties", code: 0x70414c4c, type: typeType) // "pALL"
    public static let property_ = SPRSymbol(name: "property_", code: 0x70726f70, type: typeType) // "prop"
    public static let record = SPRSymbol(name: "record", code: 0x7265636f, type: typeType) // "reco"
    public static let reference = SPRSymbol(name: "reference", code: 0x6f626a20, type: typeType) // "obj\0x20"
    public static let RGB16Color = SPRSymbol(name: "RGB16Color", code: 0x74723136, type: typeType) // "tr16"
    public static let RGB96Color = SPRSymbol(name: "RGB96Color", code: 0x74723936, type: typeType) // "tr96"
    public static let RGBColor = SPRSymbol(name: "RGBColor", code: 0x63524742, type: typeType) // "cRGB"
    public static let rotation = SPRSymbol(name: "rotation", code: 0x74726f74, type: typeType) // "trot"
    public static let Saturday = SPRSymbol(name: "Saturday", code: 0x73617420, type: typeType) // "sat\0x20"
    public static let script = SPRSymbol(name: "script", code: 0x73637074, type: typeType) // "scpt"
    public static let September = SPRSymbol(name: "September", code: 0x73657020, type: typeType) // "sep\0x20"
    public static let shortFloat = SPRSymbol(name: "shortFloat", code: 0x73696e67, type: typeType) // "sing"
    public static let shortInteger = SPRSymbol(name: "shortInteger", code: 0x73686f72, type: typeType) // "shor"
    public static let showAll = SPRSymbol(name: "showAll", code: 0x78707361, type: typeType) // "xpsa"
    public static let string = SPRSymbol(name: "string", code: 0x54455854, type: typeType) // "TEXT"
    public static let styledClipboardText = SPRSymbol(name: "styledClipboardText", code: 0x7374796c, type: typeType) // "styl"
    public static let styledText = SPRSymbol(name: "styledText", code: 0x53545854, type: typeType) // "STXT"
    public static let Sunday = SPRSymbol(name: "Sunday", code: 0x73756e20, type: typeType) // "sun\0x20"
    public static let textStyleInfo = SPRSymbol(name: "textStyleInfo", code: 0x74737479, type: typeType) // "tsty"
    public static let Thursday = SPRSymbol(name: "Thursday", code: 0x74687520, type: typeType) // "thu\0x20"
    public static let TIFFPicture = SPRSymbol(name: "TIFFPicture", code: 0x54494646, type: typeType) // "TIFF"
    public static let Tuesday = SPRSymbol(name: "Tuesday", code: 0x74756520, type: typeType) // "tue\0x20"
    public static let typeClass = SPRSymbol(name: "typeClass", code: 0x74797065, type: typeType) // "type"
    public static let unicodeText = SPRSymbol(name: "unicodeText", code: 0x75747874, type: typeType) // "utxt"
    public static let unsignedInteger = SPRSymbol(name: "unsignedInteger", code: 0x6d61676e, type: typeType) // "magn"
    public static let utf16Text = SPRSymbol(name: "utf16Text", code: 0x75743136, type: typeType) // "ut16"
    public static let utf8Text = SPRSymbol(name: "utf8Text", code: 0x75746638, type: typeType) // "utf8"
    public static let version = SPRSymbol(name: "version", code: 0x76657273, type: typeType) // "vers"
    public static let Wednesday = SPRSymbol(name: "Wednesday", code: 0x77656420, type: typeType) // "wed\0x20"
    public static let writingCode = SPRSymbol(name: "writingCode", code: 0x70736374, type: typeType) // "psct"

    // Enumerators
    public static let ask = SPRSymbol(name: "ask", code: 0x61736b20, type: typeEnumerated) // "ask\0x20"
    public static let case_ = SPRSymbol(name: "case_", code: 0x63617365, type: typeEnumerated) // "case"
    public static let diacriticals = SPRSymbol(name: "diacriticals", code: 0x64696163, type: typeEnumerated) // "diac"
    public static let expansion = SPRSymbol(name: "expansion", code: 0x65787061, type: typeEnumerated) // "expa"
    public static let hyphens = SPRSymbol(name: "hyphens", code: 0x68797068, type: typeEnumerated) // "hyph"
    public static let no = SPRSymbol(name: "no", code: 0x6e6f2020, type: typeEnumerated) // "no\0x20\0x20"
    public static let numericStrings = SPRSymbol(name: "numericStrings", code: 0x6e756d65, type: typeEnumerated) // "nume"
    public static let punctuation = SPRSymbol(name: "punctuation", code: 0x70756e63, type: typeEnumerated) // "punc"
    public static let whitespace = SPRSymbol(name: "whitespace", code: 0x77686974, type: typeEnumerated) // "whit"
    public static let yes = SPRSymbol(name: "yes", code: 0x79657320, type: typeEnumerated) // "yes\0x20"
}

public typealias SPR = SPRSymbol // allows symbols to be written as (e.g.) SPR.name instead of SPRSymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on System Preferences.app terminology

public protocol SPRCommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension SPRCommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func authorize(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "authorize", eventClass: 0x6d697363, eventID: 0x6d617574, // "misc"/"maut"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func authorize<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "authorize", eventClass: 0x6d697363, eventID: 0x6d617574, // "misc"/"maut"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reveal(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reveal", eventClass: 0x6d697363, eventID: 0x6d766973, // "misc"/"mvis"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reveal<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reveal", eventClass: 0x6d697363, eventID: 0x6d766973, // "misc"/"mvis"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func timedLoad(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "timedLoad", eventClass: 0x6d697363, eventID: 0x6d746d6c, // "misc"/"mtml"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func timedLoad<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "timedLoad", eventClass: 0x6d697363, eventID: 0x6d746d6c, // "misc"/"mtml"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol SPRObject: SwiftAutomation.ObjectSpecifierExtension, SPRCommand {} // provides vars and methods for constructing specifiers

extension SPRObject {
    
    // Properties
    public var class_: SPRItem {return self.property(0x70636c73) as! SPRItem} // "pcls"
    public var currentPane: SPRItem {return self.property(0x78706370) as! SPRItem} // "xpcp"
    public var id: SPRItem {return self.property(0x49442020) as! SPRItem} // "ID\0x20\0x20"
    public var localizedName: SPRItem {return self.property(0x7870736e) as! SPRItem} // "xpsn"
    public var name: SPRItem {return self.property(0x706e616d) as! SPRItem} // "pnam"
    public var preferencesWindow: SPRItem {return self.property(0x78707077) as! SPRItem} // "xppw"
    public var properties: SPRItem {return self.property(0x70414c4c) as! SPRItem} // "pALL"
    public var showAll: SPRItem {return self.property(0x78707361) as! SPRItem} // "xpsa"

    // Elements
    public var anchors: SPRItems {return self.elements(0x78707061) as! SPRItems} // "xppa"
    public var items: SPRItems {return self.elements(0x636f626a) as! SPRItems} // "cobj"
    public var panes: SPRItems {return self.elements(0x78707062) as! SPRItems} // "xppb"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class SPRInsertion: SwiftAutomation.InsertionSpecifier, SPRCommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class SPRItem: SwiftAutomation.ObjectSpecifier, SPRObject {
    public typealias InsertionSpecifierType = SPRInsertion
    public typealias ObjectSpecifierType = SPRItem
    public typealias MultipleObjectSpecifierType = SPRItems
}

// by-range/by-test/all
public class SPRItems: SPRItem, SwiftAutomation.ElementsSpecifierExtension {}

// App/Con/Its
public class SPRRoot: SwiftAutomation.RootSpecifier, SPRObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = SPRInsertion
    public typealias ObjectSpecifierType = SPRItem
    public typealias MultipleObjectSpecifierType = SPRItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class SystemPreferences: SPRRoot, SwiftAutomation.ApplicationExtension {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.DefaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.DefaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.AppRootDesc, appData: type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.apple.systempreferences", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let SPRApp = _untargetedAppData.app as! SPRRoot
public let SPRCon = _untargetedAppData.con as! SPRRoot
public let SPRIts = _untargetedAppData.its as! SPRRoot


/******************************************************************************/
// Static types

public typealias SPRRecord = [SPRSymbol:Any] // default Swift type for AERecordDescs






