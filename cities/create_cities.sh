#!/bin/bash

# Array of all Ontario cities
cities=(
  "Barrie" "Belleville" "Brampton" "Brant" "Brantford" "Brockville" "Burlington" 
  "Cambridge" "Clarence-Rockland" "Cornwall" "Dryden" "Elliot Lake" "Greater Sudbury" 
  "Guelph" "Haldimand County" "Hamilton" "Kawartha Lakes" "Kenora" "Kingston" 
  "Kitchener" "London" "Markham" "Niagara Falls" "Norfolk County" "North Bay" 
  "Orillia" "Oshawa" "Ottawa" "Owen Sound" "Pembroke" "Peterborough" "Pickering" 
  "Port Colborne" "Prince Edward County" "Quinte West" "Richmond Hill" "Sarnia" 
  "Sault Ste. Marie" "St. Catharines" "St. Thomas" "Stratford" "Temiskaming Shores" 
  "Thorold" "Thunder Bay" "Timmins" "Toronto" "Vaughan" "Waterloo" "Welland" 
  "Windsor" "Woodstock"
)

# City descriptions for hero section
declare -A descriptions=(
  ["Barrie"]="Barrie's premier photo booth rental service brings excitement to this beautiful lakeside city. From waterfront venues to community centers, we specialize in creating memorable experiences for Barrie's vibrant community."
  ["Belleville"]="Belleville's trusted photo booth rental service for the Bay of Quinte region. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout Belleville."
  ["Brampton"]="Brampton's multicultural photo booth rental service celebrates the city's diversity. From Punjabi weddings to corporate events, we create memorable experiences for Brampton's vibrant communities."
  ["Brant"]="Brant's premier photo booth rental service covering all communities in Brant County. We bring professional entertainment to your celebrations with our premium photo booth experiences."
  ["Brantford"]="Brantford's trusted photo booth rental service brings excitement to the Telephone City. We specialize in creating unforgettable memories for Brantford's diverse celebrations."
  ["Brockville"]="Brockville's premier photo booth rental service along the St. Lawrence River. From waterfront venues to historic locations, we create memorable experiences for Brockville events."
  ["Burlington"]="Burlington's lakeside photo booth rental service brings premium entertainment to your celebrations. From waterfront venues to community centers, we serve all of Burlington with professional excellence."
  ["Cambridge"]="Cambridge's trusted photo booth rental service covering all three historic communities. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout Cambridge."
  ["Clarence-Rockland"]="Clarence-Rockland's bilingual photo booth rental service serving Eastern Ontario. We provide professional photo booth experiences for weddings, corporate events, and community celebrations."
  ["Cornwall"]="Cornwall's premier photo booth rental service along the St. Lawrence River. We bring professional entertainment and memorable experiences to all Cornwall celebrations."
  ["Dryden"]="Dryden's trusted photo booth rental service in Northwestern Ontario. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout the region."
  ["Elliot Lake"]="Elliot Lake's premier photo booth rental service in Northern Ontario. We specialize in creating memorable experiences for community events and celebrations in Elliot Lake."
  ["Greater Sudbury"]="Greater Sudbury's premier photo booth rental service in Northern Ontario. From mining community celebrations to corporate events, we bring professional entertainment to all of Sudbury."
  ["Guelph"]="Guelph's trusted photo booth rental service in the Royal City. We bring professional photo booth experiences to weddings, university events, and celebrations throughout Guelph."
  ["Haldimand County"]="Haldimand County's premier photo booth rental service covering all communities. We bring professional entertainment to your rural and urban celebrations across the county."
  ["Hamilton"]="Hamilton's premier photo booth rental service in the Steel City. From waterfront venues to mountain locations, we create memorable experiences for Hamilton's diverse celebrations."
  ["Kawartha Lakes"]="Kawartha Lakes' trusted photo booth rental service covering all lakeside communities. We bring professional photo booth experiences to cottages, venues, and celebrations throughout the region."
  ["Kenora"]="Kenora's premier photo booth rental service in Northwestern Ontario. From Lake of the Woods venues to community centers, we create memorable experiences for Kenora celebrations."
  ["Kingston"]="Kingston's trusted photo booth rental service in the Limestone City. From historic venues to waterfront locations, we bring professional entertainment to all Kingston celebrations."
  ["Kitchener"]="Kitchener's premier photo booth rental service in the heart of Waterloo Region. We bring professional entertainment and memorable experiences to all Kitchener celebrations."
  ["London"]="London's trusted photo booth rental service in Southwestern Ontario. From downtown venues to suburban locations, we create memorable experiences for London's diverse celebrations."
  ["Markham"]="Markham's multicultural photo booth rental service celebrates the city's diversity. From Chinese weddings to corporate events, we create memorable experiences for Markham's vibrant communities."
  ["Niagara Falls"]="Niagara Falls' premier photo booth rental service in the tourist capital. From wedding venues to corporate events, we bring professional entertainment to all Niagara Falls celebrations."
  ["Norfolk County"]="Norfolk County's trusted photo booth rental service covering all communities. We bring professional photo booth experiences to rural and lakeside celebrations throughout the county."
  ["North Bay"]="North Bay's premier photo booth rental service in Northern Ontario. From waterfront venues to community centers, we create memorable experiences for North Bay celebrations."
  ["Orillia"]="Orillia's trusted photo booth rental service in the Sunshine City. From lakeside venues to community events, we bring professional entertainment to all Orillia celebrations."
  ["Oshawa"]="Oshawa's premier photo booth rental service in Durham Region. We bring professional entertainment and memorable experiences to all Oshawa celebrations and corporate events."
  ["Ottawa"]="Ottawa's bilingual photo booth rental service in Canada's capital. From Parliament Hill events to Byward Market venues, we create memorable experiences for Ottawa's diverse celebrations."
  ["Owen Sound"]="Owen Sound's trusted photo booth rental service on Georgian Bay. From waterfront venues to community centers, we bring professional entertainment to all Owen Sound celebrations."
  ["Pembroke"]="Pembroke's premier photo booth rental service in the Ottawa Valley. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout the region."
  ["Peterborough"]="Peterborough's trusted photo booth rental service in the Kawarthas. From downtown venues to lakeside locations, we create memorable experiences for Peterborough celebrations."
  ["Pickering"]="Pickering's premier photo booth rental service in Durham Region. We bring professional entertainment and memorable experiences to all Pickering celebrations and events."
  ["Port Colborne"]="Port Colborne's trusted photo booth rental service on Lake Erie. From waterfront venues to community centers, we bring professional entertainment to all Port Colborne celebrations."
  ["Prince Edward County"]="Prince Edward County's premier photo booth rental service covering the entire county. From winery weddings to lakeside venues, we create memorable experiences for all celebrations."
  ["Quinte West"]="Quinte West's trusted photo booth rental service in the Bay of Quinte region. We bring professional photo booth experiences to weddings, military events, and celebrations throughout the area."
  ["Richmond Hill"]="Richmond Hill's premier photo booth rental service in York Region. We bring professional entertainment and memorable experiences to all Richmond Hill celebrations and corporate events."
  ["Sarnia"]="Sarnia's trusted photo booth rental service on the St. Clair River. From waterfront venues to community centers, we bring professional entertainment to all Sarnia celebrations."
  ["Sault Ste. Marie"]="Sault Ste. Marie's premier photo booth rental service in Northern Ontario. From waterfront venues to community events, we create memorable experiences for Sault Ste. Marie celebrations."
  ["St. Catharines"]="St. Catharines' trusted photo booth rental service in the heart of Niagara. From downtown venues to vineyard locations, we bring professional entertainment to all St. Catharines celebrations."
  ["St. Thomas"]="St. Thomas' premier photo booth rental service in Southwestern Ontario. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout the Railway City."
  ["Stratford"]="Stratford's trusted photo booth rental service in the Festival City. From theatre events to community celebrations, we bring professional entertainment to all Stratford occasions."
  ["Temiskaming Shores"]="Temiskaming Shores' premier photo booth rental service in Northern Ontario. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout the region."
  ["Thorold"]="Thorold's trusted photo booth rental service in the Niagara Region. From canal-side venues to community centers, we bring professional entertainment to all Thorold celebrations."
  ["Thunder Bay"]="Thunder Bay's premier photo booth rental service in Northwestern Ontario. From lakeside venues to community events, we create memorable experiences for Thunder Bay's diverse celebrations."
  ["Timmins"]="Timmins' trusted photo booth rental service in Northern Ontario. We bring professional photo booth experiences to mining community celebrations, corporate events, and weddings throughout the region."
  ["Toronto"]="Toronto's premier photo booth rental service in Canada's largest city. From downtown venues to suburban locations, we create memorable experiences for Toronto's incredibly diverse celebrations."
  ["Vaughan"]="Vaughan's multicultural photo booth rental service in York Region. From Woodbridge to Thornhill, we bring professional entertainment to all Vaughan celebrations and corporate events."
  ["Waterloo"]="Waterloo's trusted photo booth rental service in the heart of Waterloo Region. From university events to corporate celebrations, we bring professional entertainment to all Waterloo occasions."
  ["Welland"]="Welland's premier photo booth rental service in the Niagara Region. From canal-side venues to community centers, we create memorable experiences for all Welland celebrations."
  ["Windsor"]="Windsor's trusted photo booth rental service on the Detroit River. From waterfront venues to community events, we bring professional entertainment to all Windsor celebrations."
  ["Woodstock"]="Woodstock's premier photo booth rental service in Oxford County. We bring professional photo booth experiences to weddings, corporate events, and celebrations throughout the Friendly City."
)

# Read the mississauga template
template=$(cat mississauga.html)

# Create each city page
for city in "${cities[@]}"; do
  # Create URL-friendly filename
  filename=$(echo "$city" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr '.' '')
  
  # Get city description
  desc="${descriptions[$city]}"
  
  # Replace city name in template
  page="$template"
  page="${page//Mississauga/$city}"
  page="${page//mississauga/$filename}"
  
  # Replace hero subtitle with city-specific description
  page=$(echo "$page" | sed "s|Mississauga's premier photo booth rental service brings excitement to Canada's sixth-largest city. From Cooksville community centers to Port Credit waterfront venues, we specialize in creating memorable experiences for Mississauga's diverse communities.|$desc|g")
  
  # Replace "Why Choose" section city-specific content
  page=$(echo "$page" | sed "s|Serving Mississauga for years, we understand the unique needs of this multicultural city. From Punjabi weddings in Malton to corporate events at Square One, our team navigates Mississauga's diverse celebration styles with cultural sensitivity and professional expertise.|Serving $city with dedication and professionalism, we understand the unique character of this community. Our experienced team brings cultural sensitivity and professional expertise to every celebration, ensuring your event is memorable and stress-free.|g")
  
  # Write the new city page
  echo "$page" > "${filename}.html"
  echo "Created ${filename}.html"
done

echo "All city pages created successfully!"
