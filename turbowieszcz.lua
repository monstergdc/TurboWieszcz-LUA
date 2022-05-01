
-- Turbo Wieszcz ++ LUA version, v1.0
-- (c)2022 Noniewicz.com, Jakub Noniewicz

-- translated directly from previous version written in Python
-- which was based directly on: previous version written in Delphi
-- which was based directly on: previous version written for Commodore C-64 sometime in 1993
-- by me (Jakub Noniewicz) and Freeak (Wojtek Kaczmarek)
-- which was based on:
-- idea presented in "Magazyn Amiga" magazine and implemented by Marek Pampuch.
-- also inspired by version written for iPhone by Tomek (Grych) Gryszkiewicz.
-- and versions written in C, JavaScript, Pascal, PHP and as CGI by Tomek (Grych) Gryszkiewicz.

-- you may use link below to run this code directly in the browser:
-- https://www.tutorialspoint.com/execute_lua_online.php

-- created: 20220501 (initial release took: 2.5h)
-- updated: -


ENDINGS1 = {'.', '...', '.', '!', '.'}
ENDINGS2 = {'', '...', '', '!', ''}
TRYB2ORDER = {{0,1,2,3}, {0,1,3,2}, {0,2,1,3}} -- ABAB, ABBA, AABB

titles = {
        'Zag³ada',
        'To ju¿ koniec',
        'Œwiat ginie',
        'Z wizyt¹ w piekle',
        'Kataklizm',
        'Dzieñ z ¿ycia...',
        'Masakra',
        'Katastrofa',
        'Wszyscy zginiemy...',
        'Pokój?',
        'Koniec',
        'Koniec ludzkoœci',
        'Telefon do Boga',
        'Wieczne ciemnoœci',
        'Mrok',
        'Mrok w œrodku dnia',
        'Ciemnoœæ',
        'Piorunem w ³eb',
        'Marsz troli',
        'Szyderstwa Z³ego',
        'Okrponoœci œwiata',
        'Umrzeæ po raz ostatni',
        'Potêpienie',
        'Ból mózgu',
        'Wieczne wymioty',
        'Zatrute dusze',
        'Uciekaj',
        'Apokalipsa',
        'Z³udzenie pryska',
        'Makabra',
        'Zag³ada œwiata',
        'Œmieræ',
        'Spokój'
}

data = {}
for i = 0, 4-1 do
    data[i] = {}
    for j = 0, 32-1 do
        data[i][j] = ""
    end
end

-- ///////////////////////////////////////////////
-- //po 10
    data[0][0]  = 'Czy na te zbrodnie nie bêdzie kary?'
    data[0][1]  = 'Opustosza³y bagna, moczary'
    data[0][2]  = 'Na nic siê mod³y zdadz¹ ni czary'
    data[0][3]  = 'Z krwi mordowanych s¹cz¹ puchary'
    data[0][4]  = 'To nietoperze, wê¿e, kalmary'
    data[0][5]  = 'Pró¿no nieszczêœni sypi¹ talary'
    data[0][6]  = 'Za co nam znosiæ takie ciê¿ary'
    data[0][7]  = 'Z³owrogo iskrz¹ kóbr okulary'
    data[0][8]  = 'Pró¿no swe mod³y wznosi wikary'
    data[0][9]  = 'Pustosz¹ sny twoje z³e nocne mary'
    data[0][10] = 'Pró¿no nieszczêœnik sypie talary'
    data[0][11] = 'Przedziwnie tka siê ¿ycia logarytm'
    data[0][12] = 'Ju¿ Strach wypuœci³ swoje ogary'
    data[0][13] = 'Niebawem zginiesz w szponach poczwary'
    data[0][14] = 'Wbijaj¹ pale z³ote kafary'
    data[0][15] = '¯ycie odkrywa swoje przywary'
    data[0][16] = 'Na dnie ponurej, pustej pieczary'
    data[0][17] = 'Apokalipsy nadesz³y czary'
    data[0][18] = 'Upad³y anio³ wspomina chwa³ê'
    data[0][19] = '¯ycie ukrywa swoje przywary'
    data[0][20] = 'Dziwnych owadów wzlatuj¹ chmary'
    data[0][21] = 'Bombowce bior¹ nasze namiary'
    data[0][22] = 'Nie da siê chwyciæ z czartem za bary'
    data[0][23] = 'Pró¿no frajerzy sypi¹ talary'
    data[0][24] = 'Nie da sie wyrwaæ czartom towaru'
    data[0][25] = 'Po co nam s¹czyæ pod³e browary'
    data[0][26] = 'Diler ju¿ nie dostarczy towaru'
    data[0][27] = 'Lokomotywa nie ma ju¿ pary'
    data[0][28] = 'Gdy nie ka¿dego staæ na browary'
    data[0][29] = 'Po¿ar³ Hilary swe okulary'
    data[0][30] = 'Spowi³y nas truj¹ce opary'
    data[0][31] = 'To nie jest calka ani logarytm'
-- ///////////////////////////////////////////////
-- //po 8
    data[1][0]  = 'Ju¿ na arenê krew tryska'
    data[1][1]  = 'Ju¿ piana cieknie im z pyska'
    data[1][2]  = 'Ju¿ hen w oddali gdzieœ b³yska'
    data[1][3]  = 'Œmieræ w k¹cie czai siê bliska'
    data[1][4]  = 'Niesamowite duchów igrzyska'
    data[1][5]  = 'Ju¿ zaciskaj¹c ³apiska'
    data[1][6]  = 'Zamiast pozostaæ w zamczyskach'
    data[1][7]  = 'Rzeka wylewa z ³o¿yska'
    data[1][8]  = 'Nieszczêœæ wyla³a siê miska'
    data[1][9]  = 'Ju¿ zaciskaj¹c zêbiska'
    data[1][10] = 'Otwarta nieszczêœæ walizka'
    data[1][11] = 'Niczym na rzymskich boiskach'
    data[1][12] = 'Czart wznieca swe paleniska'
    data[1][13] = 'A w mroku œwiec¹ zêbiska'
    data[1][14] = 'Zewsz¹d dochodz¹ wyzwiska'
    data[1][15] = 'Œwiêtych g³ód wiary przyciska'
    data[1][16] = 'Ponuro patrzy z ich pyska'
    data[1][17] = 'Mg³a stoi na uroczyskach'
    data[1][18] = 'Koœci pogrzebi¹ urwiska'
    data[1][19] = 'G³ód wiary tak nas przyciska'
    data[1][20] = 'Runê³y skalne zwaliska'
    data[1][21] = 'Czart rozpala paleniska'
    data[1][22] = 'A w mroku s³ychaæ wyzwiska'
    data[1][23] = 'Znów pusta ¿ebraka miska'
    data[1][24] = 'Diabelskie to s¹ igrzyska'
    data[1][25] = 'Nie powiedz diab³u nazwiska'
    data[1][26] = 'Najg³oœniej s³ychaæ wyzwiska'
    data[1][27] = 'Diabelskie maj¹ nazwiska'
    data[1][28] = 'Tam uciekaj¹ ludziska'
    data[1][29] = 'Tak rzecze stara hipiska'
    data[1][30] = 'Gdzie dawne ludzi siedliska'
    data[1][31] = 'Najg³oœniej piszczy hipiska'
-- ///////////////////////////////////////////////
-- //po 10
    data[2][0]  = 'Rw¹ pazurami swoje ofiary'
    data[2][1]  = 'Nic nie pomo¿e tu druid stary'
    data[2][2]  = 'To nocne zjawy i senne mary'
    data[2][3]  = 'NiegroŸne przy nich lwowskie batiary'
    data[2][4]  = 'Pod wodz¹ ksiê¿nej diablic Tamary'
    data[2][5]  = 'Z dala straszliwe tr¹bia fanfary'
    data[2][6]  = 'Sk¹d ich przywiod³y piek³a bezmiary'
    data[2][7]  = 'Zaœ dooko³a ³uny, po¿ary'
    data[2][8]  = 'A twoje cia³o rozszarpie Wilk Szary'
    data[2][9]  = 'Tu nie pomo¿e ju¿ si³a wiary'
    data[2][10] = 'Tak cudzych nieszczêœæ pij¹ nektary'
    data[2][11] = 'Wszystko zalewa wrz¹cy liparyt'
    data[2][12] = 'Zabójcze s¹ ich niecne zamiary'
    data[2][13] = 'Zatrute dusze ³¹cz¹ siê w pary'
    data[2][14] = 'Œwiat pokazuje swoje wymiary'
    data[2][15] = 'Z ¿yciem siê teraz weŸmiesz za bary'
    data[2][16] = 'Brak uczuæ, chêci, czasem brak wiary'
    data[2][17] = 'Wspomnij, co mówi³ Mickiewicz stary'
    data[2][18] = 'Spalonych lasów strasz¹ hektary'
    data[2][19] = 'Z ¿yciem siê dzisiaj weŸmiesz za bary'
    data[2][20] = 'Ksi¹dz pozostaje nagle bez wiary'
    data[2][21] = 'Papie¿ zaczyna odprawiaæ czary'
    data[2][22] = 'Tu nie pomo¿e paciorek, stary'
    data[2][23] = 'NiegroŸne przy nich nawet Atari'
    data[2][24] = 'Takie s¹ oto piek³a bezmiary'
    data[2][25] = 'A teraz nagle jesteœ ju¿ stary'
    data[2][26] = 'Mordercy licz¹ swoje ofiary'
    data[2][27] = 'I bez wartoœci s¹ ju¿ dolary'
    data[2][28] = 'Gdzie siê podzia³y te nenufary'
    data[2][29] = 'Upada oto d¹b ten prastary'
    data[2][30] = 'Bystro œmigaj¹ nawet niezdary'
    data[2][31] = 'Ju¿ nieruchome ich awatary'
-- ///////////////////////////////////////////////
-- //po 8
    data[3][0]  = 'Wnet na nas te¿ przyjdzie kryska'
    data[3][1]  = 'Znik¹d ¿adnego schroniska'
    data[3][2]  = 'Powietrze tnie œwist biczyska'
    data[3][3]  = 'Rodem z czarciego urwiska'
    data[3][4]  = 'I sw¹d nieznoœny siê wciska'
    data[3][5]  = 'Huk, jak z wielkiego lotniska'
    data[3][6]  = 'Z³owroga brzmi¹ ich nazwiska'
    data[3][7]  = 'W k¹cie nieœmia³o ktoœ piska'
    data[3][8]  = 'Ktoœ obok morduje liska'
    data[3][9]  = 'Krwi¹ ociekaj¹ zêbiska'
    data[3][10] = 'Woko³o dzikie piar¿yska'
    data[3][11] = 'I ¿¹dza czai siê niska'
    data[3][12] = 'Diabe³ ciê dzisiaj wyzyska'
    data[3][13] = 'P³on¹ zag³ady ogniska'
    data[3][14] = 'Gwa³t niech siê gwa³tem odciska!'
    data[3][15] = 'Stoisz na skraju urwiska'
    data[3][16] = 'Tam szatan czarta wyiska'
    data[3][17] = 'Uciekaj, przysz³oœæ jest mglista'
    data[3][18] = 'Nadziei z³udzenie pryska'
    data[3][19] = 'Wydziobi¹ oczy ptaszyska'
    data[3][20] = 'Padaj¹ ³by na klepisko'
    data[3][21] = 'Œmieræ zbiera ¿niwo w ko³yskach'
    data[3][22] = 'Coœ znowu zgrzyta w ³o¿yskach'
    data[3][23] = 'Spadasz z wielkiego urwiska'
    data[3][24] = 'Lawa spod ziemi wytryska'
    data[3][25] = 'Woko³o grzmi albo b³yska'
    data[3][26] = 'Fa³szywe z³oto po³yska'
    data[3][27] = 'Najwiêcej czart tu uzyska'
    data[3][28] = 'Owieczki Z³y tu pozyska'
    data[3][29] = 'Owieczki spad³y z urwiska'
    data[3][30] = 'Snuj¹ siê dymy z ogniska'
    data[3][31] = 'To czarne lec¹ ptaszyska'

    number = {}
    ending = {}


function _check_uniq_ok(z, w, value, repetitions_ok)
    ok = true
    if repetitions_ok == false then
        for i = 0, z-1 do
            if (number[w][i] == value) then ok = false end
        end
    end
    return ok
end

function _set_random_row(z, w, repetitions_ok)
    while true do
        number[w][z] = math.random(0, #data[w]-1)
        if ((z == 0) or _check_uniq_ok(z, w, number[w][z], repetitions_ok)) then break end
    end
end

function _build_ending(z, w, s)
    chk = true
    result = ''
    if (#s > 0) then
        if (s[#s] == '?') or (s[#s] == '!') then
            chk = False
        end
    end
    if ((w == 1) and chk) then
        result = ENDINGS2[ending[0][z]]
    end
    if ((w == 3) and chk) then
        result = ENDINGS1[ending[1][z]]
    end
    return result
end

function _build_line(z, w, w0)
    s = data[w][number[w][z]]
    return ' ' .. s .. _build_ending(z, w0, s) .. "\n"
end

function _build_stanza(z, verse_mode)
    return
      _build_line(z, TRYB2ORDER[verse_mode][0+1], 0) ..
      _build_line(z, TRYB2ORDER[verse_mode][1+1], 1) ..
      _build_line(z, TRYB2ORDER[verse_mode][2+1], 2) ..
      _build_line(z, TRYB2ORDER[verse_mode][3+1], 3)
end

function generate_poem(cnt, verse_mode, repetitions_ok)
    if cnt < 1 then return "" end


    stanza_count = cnt
    if (stanza_count > 32) then stanza_count = 32 end
    title_id = math.random(1, #titles)

    math.randomseed(os.time())

    for i = 0, stanza_count-1 do
        number[i] = {}
        ending[i] = {}
        for j = 0, 4-1 do
            number[i][j] = 0
        end
        for j = 0, 2-1 do
            ending[i][j] = 0
        end
    end

    for z = 0, stanza_count-1 do
        for w = 0, 4-1 do
            number[w][z] = -1
            ending[0][z] = math.random(1, #ENDINGS2)
            ending[1][z] = math.random(1, #ENDINGS1)
            _set_random_row(z, 0, repetitions_ok)
            _set_random_row(z, 1, repetitions_ok)
            _set_random_row(z, 2, repetitions_ok)
            _set_random_row(z, 3, repetitions_ok)
        end
    end

    poem = "\n " .. titles[title_id] .. "\n\n"
    for z = 0, stanza_count-1 do
        poem = poem .. _build_stanza(z, verse_mode+1) .. "\n"
    end
    return poem
end

-- run

io.write('Podaj iloœæ zwrotek (1-32): ')
local cnt = io.read("*n")
io.write('\n\n')

print(generate_poem(cnt, 0, false))

