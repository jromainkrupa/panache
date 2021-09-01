module DateHelper
    def format_date_prettify(date)
        month_names = [
            nil, "Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin" ,"Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"
        ]
        month_names[date.month]
        "#{date.strftime('%d')} #{month_names[date.month]} #{date.strftime('%Y')}"
    end
end