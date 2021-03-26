<% if(hana){ -%>
using {<%= projectName %>.db as db} from '../db/data-model';
<% } -%>

<% if(apiS4HCSO){ -%>
using { API_SALES_ORDER_SRV } from './external/API_SALES_ORDER_SRV.csn';
<% } -%>

<% if(apiSFSFRC){ -%>
using { RCMCandidate } from './external/RCMCandidate.csn';
<% } -%>

service CatalogService @(path : '/catalog')
<% if(authentication){ -%>
@(requires: 'authenticated-user')
<% } -%>
{
<% if(hana){ -%>
    entity Sales
<% if(authorization){ -%>
      @(restrict: [{ grant: ['READ'],
                     to: 'Viewer'
<% if(attributes){ -%>
                    ,where: 'region = $user.Region' 
<% } -%>
                   },
                   { grant: ['WRITE'],
                     to: 'Admin' 
                   }
                  ])
<% } -%>
      as select * from db.Sales
      actions {
<% if(apiS4HCSO){ -%>
<% if(authorization){ -%>
        @(restrict: [{ to: 'Viewer' }])
<% } -%>
        function largestOrder() returns String;
<% } -%>
<% if(authorization){ -%>
        @(restrict: [{ to: 'Admin' }])
<% } -%>
        action boost();
      }
    ;
<% } -%>

<% if(hanaNative){ -%>
    function topSales
<% if(authorization){ -%>
      @(restrict: [{ to: 'Viewer' }])
<% } -%>
      (amount: Integer)
      returns many Sales;
<% } -%>

<% if(apiS4HCSO){ -%>
    @readonly
    entity SalesOrders
<% if(authorization){ -%>
      @(restrict: [{ to: 'Viewer' }])
<% } -%>
      as projection on API_SALES_ORDER_SRV.A_SalesOrder {
          SalesOrder,
          SalesOrganization,
          DistributionChannel,
          SoldToParty,
          IncotermsLocation1,
          TotalNetAmount,
          TransactionCurrency
        };

<% if(em){ -%>
    entity SalesOrdersLog
<% if(authorization){ -%>
      @(restrict: [{ to: 'Viewer' }])
<% } -%>
      as select * from db.SalesOrdersLog
    ;
<% } -%>
<% } -%>

<% if(apiSFSFRC){ -%>
    @readonly
    entity Candidates
<% if(authorization){ -%>
      @(restrict: [{ to: 'Viewer' }])
<% } -%>
      as projection on RCMCandidate.Candidate {
          candidateId,
          firstName,
          lastName,
          cellPhone,
          city,
          zip,
          country
        };

<% if(em){ -%>
    entity CandidatesLog
<% if(authorization){ -%>
      @(restrict: [{ to: 'Viewer' }])
<% } -%>
      as select * from db.CandidatesLog
    ;
<% } -%>
<% } -%>

<% if(authentication){ -%>
    type userRoles { identified: Boolean; authenticated: Boolean; <% if(authorization){ -%>Viewer: Boolean; Admin: Boolean; <% } -%><% if(multiTenant){ -%>Callback: Boolean; ExtendCDS: Boolean; ExtendCDSdelete: Boolean; <% } -%>};
<% if(attributes){ -%>
    type userAttrs { Region: many String; };
<% } -%>
    type user { user: String; locale: String; <% if(multiTenant){ -%>tenant: String; <% } -%>roles: userRoles; <% if(attributes){ -%>attrs: userAttrs; <% } -%>};
    function userInfo() returns user;
<% } -%>
};
